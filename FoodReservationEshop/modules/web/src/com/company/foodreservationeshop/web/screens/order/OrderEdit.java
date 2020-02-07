package com.company.foodreservationeshop.web.screens.order;

import com.company.foodreservationeshop.entity.Dish;
import com.company.foodreservationeshop.entity.Store;
import com.haulmont.cuba.core.global.DataManager;
import com.haulmont.cuba.core.global.UserSessionSource;
import com.haulmont.cuba.gui.Notifications;
import com.haulmont.cuba.gui.Screens;
import com.haulmont.cuba.gui.components.Button;
import com.haulmont.cuba.gui.components.HasValue;
import com.haulmont.cuba.gui.components.Table;
import com.haulmont.cuba.gui.model.CollectionContainer;
import com.haulmont.cuba.gui.model.CollectionLoader;
import com.haulmont.cuba.gui.model.CollectionPropertyContainer;
import com.haulmont.cuba.gui.model.DataContext;
import com.haulmont.cuba.gui.screen.*;
import com.company.foodreservationeshop.entity.Order;
import com.haulmont.cuba.security.global.UserSession;

import javax.inject.Inject;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@UiController("foodreservationeshop_Order.edit")
@UiDescriptor("order-edit.xml")
@EditedEntityContainer("orderDc")
//删除 @LoadDataBeforeShow禁止界面自动加载数据，因为我们需要在onBeforeShow自定义数据加载的过程。
//@LoadDataBeforeShow
public class OrderEdit extends StandardEditor<Order> {
    @Inject
    private CollectionContainer<Dish> storeDishesDc;
    @Inject
    private DataManager dataManager;
    @Inject
    private Table<Dish> storeDishes;
    @Inject
    private CollectionPropertyContainer<Dish> dishDc;
    @Inject
    private Screens screens;
    @Inject
    private Notifications notifications;

    @Inject
    private CollectionLoader<Dish> storeDishesDl;

    @Inject
    private UserSession userSession;

    /**
     * 自定义数据加载过程: 避免StoreMenu与订单Store不一致
     * <p>
     * dataManager.XXX.view()
     * 指定了实体视图，因为从而加载出store相关属性。否则在order-edit.xml中的store字段会报错。
     *
     * @author Rico
     * @date 2020-02-08 00:19
     */
    @Subscribe
    public void onBeforeShow(BeforeShowEvent event) {
        if (getEditedEntity().getOrderAt()==null)getEditedEntity().setOrderAt(new Date());
        if (getEditedEntity().getUser()==null)getEditedEntity().setUser(userSession.getUser());
        Store store = getEditedEntity().getStore();
        if (null == store) {
            storeDishesDl.setQuery("select d from foodreservationeshop_Dish d ");
        } else {
            storeDishesDl.setParameter("store", store);
        }
        getScreenData().loadAll();
    }


    /**
     * 当订单store值被更改时，刷新store menu菜单
     *
     * @author Rico
     * @date 2020-02-08 00:22
     */

    @Subscribe("storeField")
    public void onStoreFieldValueChange(HasValue.ValueChangeEvent<Store> event) {
        Store store = event.getValue();
        if (null == store) {
            storeDishesDc.setItems(dataManager.load(Dish.class)
                    .query("select d from foodreservationeshop_Dish d ")
                    .view("dish-browse-view")
                    .list());

        } else {
            storeDishesDc.setItems(dataManager.load(Dish.class)
                    .query("select d from foodreservationeshop_Dish d where d.store = :store")
                    .parameter("store", store)
                    .view("dish-browse-view")
                    .list());
        }

    }

    /**
     * 将菜品添加到订单。
     * 包含门店选定，菜品不跨门店等校验。
     *
     * @author Rico
     * @date 2020-02-08 00:23
     */
    public void onAddDishToOrderClick() {
        Store store = getEditedEntity().getStore();
        if (null == store) {
            notifications.create(Notifications.NotificationType.WARNING).withCaption("请预定门店后,再选择菜品。").show();
            return;
        }
        boolean storeDishesMatchFlag = dishDc.getDisconnectedItems().stream().allMatch(dish -> dish.getStore().equals(store));
        if (!storeDishesMatchFlag) {
            notifications.create(Notifications.NotificationType.WARNING).withCaption("存在当前所选菜品与所在门店【" + store.getName() + "】不一致，请从同一门店选择菜品下单。").show();
            return;
        }

        //dishDc.replaceItem(storeDishes.getSingleSelected()); 该方式无法调整entity下的list<Dish>属性
        //https://doc.cuba-platform.com/manual-7.1/gui_property_containers.html
        dishDc.getMutableItems().add(storeDishes.getSingleSelected());
        Optional<BigDecimal> amount = dishDc.getDisconnectedItems().stream().map(dish -> dish.getPrice()).reduce((p1, p2) -> p1.add(p2));
        getEditedEntity().setAmount(amount.orElse(BigDecimal.ZERO));
    }

    @Subscribe
    public void onBeforeCommitChanges(BeforeCommitChangesEvent event) {
        Order editedEntity = ((OrderEdit) event.getSource()).getEditedEntity();
    }

}