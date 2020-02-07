package com.company.foodreservationeshop.web.screens.store;

import com.haulmont.cuba.gui.screen.*;
import com.company.foodreservationeshop.entity.Store;

@UiController("foodreservationeshop_Store.edit")
@UiDescriptor("store-edit.xml")
@EditedEntityContainer("storeDc")
@LoadDataBeforeShow
public class StoreEdit extends StandardEditor<Store> {
}