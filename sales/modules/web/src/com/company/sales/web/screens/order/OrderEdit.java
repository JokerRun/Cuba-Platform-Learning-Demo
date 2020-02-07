package com.company.sales.web.screens.order;

import com.haulmont.cuba.gui.screen.*;
import com.company.sales.entity.Order;

@UiController("sales_Order.edit")
@UiDescriptor("order-edit.xml")
@EditedEntityContainer("orderDc")
@LoadDataBeforeShow
public class OrderEdit extends StandardEditor<Order> {
}