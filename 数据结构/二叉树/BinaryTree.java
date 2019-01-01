package com.sanyangli.sanhalou;

/**
 * 二叉树列
 */
public class BinaryTree {
    private TreeNode root;

    public TreeNode getRoot() {
        return root;
    }

    /**
     * 实现二叉树
     *
     * @param value
     */
    public void insertNode(int value) {
        if (root == null) {
            root = new TreeNode(value);
            root.setLeftNode(null);
            root.setRightNode(null);
        } else {
            TreeNode node = root;
            while (true) {
                Integer data = node.getData();
                if (value > data) {
                    TreeNode rightNode = node.getRightNode();
                    if (rightNode != null) {
                        node = rightNode;
                    } else {
                        rightNode = new TreeNode();
                        rightNode.setData(value);
                        node.setRightNode(rightNode);
                        break;
                    }
                } else if (value < data) {
                    TreeNode leftNode = node.getLeftNode();
                    if (leftNode != null) {
                        node = leftNode;
                    } else {
                        leftNode = new TreeNode();
                        leftNode.setData(value);
                        node.setLeftNode(leftNode);
                        break;
                    }
                } else {
                    break;
                }
            }
        }
    }
}
