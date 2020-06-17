package com.Stack;

public class TraverseLeavesPrg {

	static class Node
	{
		int data;
		Node left,right;
	}
	
	static Node newNode(int data)
	{
		Node temp=new Node();
		temp.data=data;
		temp.left=temp.right=null;
		return temp;
	}
	static void traverseLeaves(Node root)
	{
		if(root==null)
			return;
		if(root.right==null&&root.left==null)
		{
			System.out.print(root.data+"->");
			return;
		}
		if(root.right!=null)
			traverseLeaves(root.right);
		if(root.left!=null)
			traverseLeaves(root.left);
		
	}
	public static void main(String args[])
	{
		Node root=newNode(8);
		root.left=newNode(3);
		root.right=newNode(10);
		root.left.left=newNode(1);
		root.left.right=newNode(6);
		root.left.right.left=newNode(4);
		root.left.right.right=newNode(7);
		root.right.right=newNode(14);
		root.right.right.left=newNode(13);
		traverseLeaves(root);
	}
}
