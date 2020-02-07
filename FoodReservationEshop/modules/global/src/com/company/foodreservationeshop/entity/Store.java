package com.company.foodreservationeshop.entity;

import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.cuba.core.entity.StandardEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@NamePattern("%s|name")
@Table(name = "FOODRESERVATIONESHOP_STORE")
@Entity(name = "foodreservationeshop_Store")
public class Store extends StandardEntity {
    private static final long serialVersionUID = 5908599064002552889L;

    @Column(name = "NAME", nullable = false)
    protected String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}