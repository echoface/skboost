#include <iostream>

using namespace std;

class Tree {
    public:
        Tree(int size);
        ~Tree();
        int *SearchNode(int nodeindex);
        bool AddNode(int nodeindex, int direction, int *pNode);
        bool DeleteNode(int nodeindex, int *pNodeOut);
        void TreeTraverse();
    private:
        int *m_ptree;
        int m_size;
};

Tree::Tree(int size) {
    m_size = size;
    m_ptree = new int[size];
    memset(m_ptree, 0, sizeof(int)*size);
    return;
}

Tree::~Tree() {
    delete []m_ptree;
    m_ptree = NULL;
}

int *Tree::SearchNode(int nodeindex) {
    if (nodeindex < 0 || nodeindex > m_size) {
        return NULL;
    }
    if (m_ptree[nodeindex] == 0) {
        return NULL;
    }
    return &m_ptree[nodeindex];
}

bool Tree::AddNode(int nodeindex, int direction, int *pNode) {
    if (nodeindex < 0 || nodeindex > m_size) {
        return false;
    }
    if (m_ptree[nodeindex] == 0) {
        return false;
    }

    int targetIndex = nodeindex*2 + (direction == 0 ? 1 : 2);
    if (targetIndex > m_size) {
        if (targetIndex > m_size || m_ptree[targetIndex] != 0) {
            return false;
        }
        m_ptree[targetIndex] = *pNode;
    }
    return true;
}

bool Tree::DeleteNode(int nodeindex, int *pNodeOut) {
    if (nodeindex < 0 || nodeindex > m_size) {
        return false;
    }
    if (m_ptree[nodeindex] == 0) {
        return false;
    }
    *pNodeOut = m_ptree[nodeindex];
    m_ptree[nodeindex] = 0;
    return true;
}

void Tree::TreeTraverse() {
    for(int i=0; i < m_size; i++) {
        cout << m_ptree[i] << "->";
    }

}


