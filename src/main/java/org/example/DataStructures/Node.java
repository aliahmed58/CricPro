package org.example.DataStructures;

public class Node<P>{
    P item;
    public Node<P> next;
    public Node<P> prev;

    public Node(P item) {
        this.item = item;
    }

    public P getItem() {
        return item;
    }

    public void setItem(P item) {
        this.item = item;
    }
}
