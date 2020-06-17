package com.tree;

import java.util.Queue; 
import java.util.LinkedList; 

class Node { 
    int data; 
    Node left, right; 
  
    public Node(int item) { 
        data = item; 
        left = null; 
        right = null; 
    } 
} 

public class BinaryTree {
	Node root;
    void printLevelOrder()  
    { 
        Queue<Node> queue = new LinkedList<Node>(); 
        queue.add(root); 
        while (!queue.isEmpty())  
        { 
            Node tempNode = queue.poll(); 
            System.out.print(tempNode.data + "->"); 
            if (tempNode.left != null) { 
                queue.add(tempNode.left); 
            } 
            if (tempNode.right != null) { 
                queue.add(tempNode.right); 
            } 
        } 
    } 
  
    public static void main(String args[])  
    { 
        BinaryTree tree_level = new BinaryTree(); 
        tree_level.root = new Node(1); 
        tree_level.root.right = new Node(2); 
        tree_level.root.right.right= new Node(5); 
        tree_level.root.right.right.left = new Node(3); 
        tree_level.root.right.right.right = new Node(6); 
        tree_level.root.right.right.left.right=new Node(4);
        System.out.println("Level order traversal of binary tree is - "); 
        tree_level.printLevelOrder(); 
    } 
}
