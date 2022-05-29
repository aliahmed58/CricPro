package org.example.DataStructures;


public class HashTable<T extends Comparable<T>> {

    private final T[] table;
    private final double C = (Math.sqrt(5) - 1) / 2;
    private final int size;
    private int cellOccupied;

    public HashTable(int s) {
        int f = s + (s / 3);
        this.size = this.getPrime(f);
        this.table = (T[]) new Comparable[size];
    }

    private int getPrime(int n) {
        while (true) {
            if (this.isPrime(n)) return n;
            n++;
        }
    }

    private boolean isPrime(int n) {
        for (int i = 2; i <= n / 2; i++)
            if (n % i == 0) return false;
        return true;
    }

    public int hash(int key) {
        return (int) Math.floor(this.size * ((key * C) % 1));
    }

    public int reHash(int key, int i) {
        return this.hash(key + i);
    }

    public void insert(T data, int key) {
        int index = this.hash(key);
        if (this.table[index] == null) {
            this.table[index] = data;
        }
        else {
            int reHash = index;
            while (this.table[index] != null) {
                reHash = this.reHash(key, reHash);
            }
            this.table[reHash] = data;
        }
        this.cellOccupied ++;
    }

    public int getSize() {
        return this.table.length;
    }

    public T get(int index) {
        return this.table[index];
    }

    public T find(T data, int key) {
        int index = this.hash(key);
        if (this.table[index].compareTo(data) == 0)
            return this.table[index];
        int reHash = index;
        while (this.table[index].compareTo(data) != 0) {
            reHash = this.reHash(key, index);
        }
        if (this.table[reHash].compareTo(data) == 0)
            return this.table[reHash];
        return null;
    }

    @Override
    public String toString() {
        String x= "";
        for (int i =0; i < this.table.length; i ++) {
            if (this.table[i] != null) {
                x += this.table[i] + " ,";
            }
        }
        return x;
    }

    public boolean isEmpty() {
        return this.cellOccupied == 0;
    }
}