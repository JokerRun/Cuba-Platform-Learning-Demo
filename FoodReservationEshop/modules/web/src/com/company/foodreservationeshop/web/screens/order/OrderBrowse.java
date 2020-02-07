package com.company.foodreservationeshop.web.screens.order;

import com.haulmont.cuba.gui.screen.*;
import com.company.foodreservationeshop.entity.Order;

@UiController("foodreservationeshop_Order.browse")
@UiDescriptor("order-browse.xml")
@LookupComponent("ordersTable")
@LoadDataBeforeShow
public class OrderBrowse extends StandardLookup<Order> {
}