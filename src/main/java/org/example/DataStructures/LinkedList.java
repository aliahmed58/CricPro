package org.example.DataStructures;

import org.example.Utility.TeamStatNode;

public class LinkedList<T extends Comparable<T>> {

    Node<T> head;

    public void insert(T data) {
        final Node<T> ins = new Node<>(data);
        if (this.head == null) this.head = ins;
        else {
            Node<T> temp = this.head;
            this.head = ins;
            ins.next = temp;
            temp.prev = ins;
        }
    }

    public Node<T> find(T data) {
        Node<T> temp = this.head;
        while (temp != null) {
            if (temp.getItem().compareTo(data) == 0)
                return temp;

            temp = temp.next;
        }
        return null;
    }

    public boolean isEmpty() {
        return this.head == null;
    }

    public Node<T> getHead() {
        return head;
    }

    @Override
    public String toString() {
        StringBuilder res = new StringBuilder();
        for (Node<T> temp = this.head; temp != null; temp = temp.next)
            res.append(temp.item).append(", ");
        return res.toString();
    }


}
