//
//  HashTable.c
//  CustomWindow
//
//  Created by Stephanie on 2017/11/9.
//  Copyright © 2017年 Stephanie. All rights reserved.
//

#include "HashTable.h"
//#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

#define SIZE 20

struct DataItem {
    int key;
    int value;
};

//pointer
struct DataItem* hashArray[SIZE];
struct DataItem* dummyItem;
struct DataItem* item;

int hashCode(int key) {
    return key%SIZE;
}

struct DataItem* search(int key) {
    //get the hash
    int hashIndex = hashCode(key);
    //move in array until an empty
    while (hashArray[hashIndex] != NULL ) {
        if (hashArray[hashIndex]->key == key) {
            return hashArray[hashIndex];
        }
        ++hashIndex;
        hashIndex %= SIZE;
    }
    return NULL;
}

void insert(int key, int value) {
    struct DataItem* item = (struct DataItem*)malloc(sizeof(struct DataItem));
    item->key = key;
    item->value = value;
    int hashIndex = hashCode(key);
    while (hashArray[hashIndex] != NULL && hashArray[hashIndex]->key != -1) {
        //go to next cell
        ++hashIndex;
        hashIndex %= SIZE;
    }
    hashArray[hashIndex] = item;
}

struct DataItem* delete(struct DataItem* item) {
    int key = item->key;
    int hashIndex = hashCode(key);
    while (hashArray[hashIndex] != NULL) {
        if (hashArray[hashIndex]->key == key) {
            struct DataItem* temp = hashArray[hashIndex];
            hashArray[hashIndex] = dummyItem;
            return temp;
        }
        ++hashIndex;
        hashIndex %= SIZE;
    }
    return NULL;
}

void display() {
    for (int i = 0; i < SIZE; i++) {
        if (hashArray[i] != NULL) {
            printf("(%d,%d)",hashArray[i]->key,hashArray[i]->value);
        }else{
            printf("~~~~");
        }
    }
    printf("\n");
}

/*
int main() {
    dummyItem = (struct DataItem*)sizeof(struct DataItem);
    dummyItem->key = -1;
    dummyItem->value = -1;
    insert(1, 20);
    insert(42, 80);
    insert(4, 25);
    insert(12, 44);
    insert(14, 32);
    insert(17, 11);
    insert(13, 78);
    insert(37, 97);
    display();
    item = search(37);
    if (item != NULL) {
        printf("Element found:%d",item->value);
    }else{
         printf("Element not found");
    }
    
    delete(item);
    
    if (item != NULL) {
        printf("Element found:%d",item->value);
    }else{
        printf("Element not found");
    }
    
}
*/
