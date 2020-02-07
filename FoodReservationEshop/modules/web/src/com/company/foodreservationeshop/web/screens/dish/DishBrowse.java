package com.company.foodreservationeshop.web.screens.dish;

import com.haulmont.cuba.gui.screen.*;
import com.company.foodreservationeshop.entity.Dish;

@UiController("foodreservationeshop_Dish.browse")
@UiDescriptor("dish-browse.xml")
@LookupComponent("dishesTable")
@LoadDataBeforeShow
public class DishBrowse extends StandardLookup<Dish> {
}