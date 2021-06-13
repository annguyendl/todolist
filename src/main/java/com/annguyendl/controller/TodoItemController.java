package com.annguyendl.controller;

import com.annguyendl.modal.TodoData;
import com.annguyendl.modal.TodoItem;
import com.annguyendl.service.TodoItemService;
import com.annguyendl.util.AttributeNames;
import com.annguyendl.util.Mapping;
import com.annguyendl.util.ViewNames;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Slf4j
@Controller
public class TodoItemController {
    // == fields ==
    private final TodoItemService todoItemService;

    // == constructor ==
    @Autowired
    public TodoItemController(TodoItemService todoItemService) {
        this.todoItemService = todoItemService;
    }

    // == model attributes ==
    @ModelAttribute
    public TodoData todoData(){
        return todoItemService.getData();
    }

    // == request handler methods ==
    @GetMapping(Mapping.ITEMS)
    public String items() {
        return ViewNames.ITEMS_LIST;
    }

    @GetMapping(Mapping.ADD_ITEM)
    public String addEditItem(@RequestParam(required = false, defaultValue = "-1") int id, Model model) {
        log.debug("addEditItem(id = {}", id);
        TodoItem todoItem = todoItemService.getItem(id);
        if (todoItem == null) {
            todoItem = new TodoItem("", "", LocalDate.now());
        }
        model.addAttribute(AttributeNames.TODO_ITEM, todoItem);
        return  ViewNames.ADD_ITEMS;
    }

    @PostMapping(Mapping.ADD_ITEM)
    public String processItem(@ModelAttribute(AttributeNames.TODO_ITEM) TodoItem todoItem) {
        log.debug("todoItem = {}", todoItem);
        if (todoItem.getId() == 0) {
            todoItemService.addItem(todoItem);
        } else {
            todoItemService.updateItem(todoItem);
        }
        return "redirect:/" + Mapping.ITEMS;
    }

    @GetMapping(Mapping.DELETE_ITEM)
    public String deleteItem(@RequestParam int id) {
        log.debug("deleteItem(@ModelAttribute int {})", id);

        todoItemService.removeItem(id);
        return "redirect:/" + Mapping.ITEMS;
    }

    @GetMapping(Mapping.VIEW_ITEM)
    public String viewItem(@RequestParam int id, Model model) {
        TodoItem todoItem = todoItemService.getItem(id);
        model.addAttribute(AttributeNames.TODO_ITEM, todoItem);
        return ViewNames.VIEW_ITEM;
    }
}
