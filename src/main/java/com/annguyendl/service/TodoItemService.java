package com.annguyendl.service;

import com.annguyendl.modal.TodoData;
import com.annguyendl.modal.TodoItem;

public interface TodoItemService {

    void addItem(TodoItem toAdd);

    void updateItem(TodoItem toUpdate);

    void removeItem(int id);

    TodoItem getItem(int id);

    TodoData getData();
}
