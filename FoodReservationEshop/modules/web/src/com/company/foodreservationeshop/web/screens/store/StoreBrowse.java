package com.company.foodreservationeshop.web.screens.store;

import com.haulmont.cuba.gui.screen.*;
import com.company.foodreservationeshop.entity.Store;

@UiController("foodreservationeshop_Store.browse")
@UiDescriptor("store-browse.xml")
@LookupComponent("storesTable")
@LoadDataBeforeShow
public class StoreBrowse extends StandardLookup<Store> {
}