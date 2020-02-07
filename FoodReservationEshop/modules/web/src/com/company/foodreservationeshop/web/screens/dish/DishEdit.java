package com.company.foodreservationeshop.web.screens.dish;

import com.haulmont.cuba.gui.screen.*;
import com.company.foodreservationeshop.entity.Dish;

@UiController("foodreservationeshop_Dish.edit")
@UiDescriptor("dish-edit.xml")
@EditedEntityContainer("dishDc")
@LoadDataBeforeShow
public class DishEdit extends StandardEditor<Dish> {
}