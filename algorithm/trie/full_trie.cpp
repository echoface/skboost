#include <cstdio>
#include <stdlib.h>
#include <stack>
#include <queue>
#include <sys/types.h>

int roundup_pow_of_two(const int x) {
  if ((x & (x - 1)) == 0) {
    return x;
  }
  int ret = 1;
  while (ret < x) {
    ret = ret << 1;
  }
  return ret;
}

struct BinaryTree {
  int size = 0;
  int _cap = 0;
  int *root;

  //size: node count
  BinaryTree(int size) :
    size(size),
    _cap(roundup_pow_of_two(size)) {
    root = (int*)malloc(_cap * sizeof(int));
    for (int i = 0; i <= _cap ; i++) {
      root[i] = i;
    }
  };
  ~BinaryTree() {
    if (root) free(root);
  };

  /*return the left child index of node i*/
  int left(int i) {return 2 * i;}
  /*return the right child index of node i*/
  int right(int i) { return 2 * i + 1;}

  int value(int i) {return *(root + i);}

  void vist_by_after(int i) {
    if (i > size) {
      return;
    }
    vist_by_after(left(i));
    vist_by_after(right(i));
    printf("(%d)->", value(i));
  }

  void vist_by_middle(int i) {
    if (i > size) {
      return;
    }
    vist_by_middle(left(i));
    printf("(%d)->", value(i));
    vist_by_middle(right(i));
  }

  void visit_by_mid_none_recursive(int i) {
    int point = i;
    std::stack<int> st;
    while (point <= size || !st.empty()) {

      while(left(point) <= size) {
        st.push(i);
        point = left(i);
      }
      if (st.size()) {
        point = st.top();
        st.pop();
        printf("(%d)->", value(point));
        point = right(point);
      }
    }
  }

  void vist_by_pre(int i) {
    if (i > size) {
      return;
    }
    printf("(%d)->", value(i));
    vist_by_pre(left(i));
    vist_by_pre(right(i));
  }

  void vist_by_bfs(int i) {
    std::queue<int> q;
    if (i > size) return;
    q.push(i);
    while(q.size()) {
      i = q.front();
      q.pop();
      printf("(%d)->", value(i));
      if (left(i) <= size) q.push(left(i));
      if (right(i) <= size) q.push(right(i));
    }
  }

  void vist_by_dfs(int i) {
    if (i > size) return;

    printf("(%d)->", value(i));
    if (left(i) <= size)
      vist_by_dfs(left(i));
    if (right(i) <= size)
      vist_by_dfs(right(i));
  }

  void vist_by_dfs_iteration(int i) {
    if (i > size) return;
    std::stack<int> st;

    while(i <= size) {
      printf("(%d)->", value(i));
      if (right(i) <= size) {
        st.push(right(i));
      }

      i = left(i);
      if (i > size && st.size()) {
        i =  st.top();
        st.pop();
      }
    }
  }

  void visit_pre_ord_none_recursive(int i) {
    int point = i;
    std::stack<int> st;
    while(point <= size) {
      printf("(%d)->", value(point));
      if (right(point) <= size) {
        st.push(right(point)); //之后访问
      }
      point = left(point);
      if (point > size && st.size()) {
        point = st.top();
        st.pop();
      }
    }
  }

  void visit_by_pre_none_recursive(int i) {
    std::stack<int> st;
    int point = i;
    while(point <= size || !st.empty()) {
      while(point <= size) {
        printf("(%d)->", value(point));
        st.push(point);
        point = left(point);
      }
      if (st.size()) {
        point = st.top();
        st.pop();
        point = right(point);
      }
    }
  }

  void visit_by_middle_none_recursive(int i) {
    std::stack<int> st;
    int point = i;
    while(point <= size || !st.empty()) {
      while(point <= size) {
        st.push(point);
        point = left(point);
      }
      if (st.size()) {
        point = st.top();
        st.pop();
        printf("(%d)->", value(point));
        point = right(point);
      }
    }
  }

  void visit_post_ord_none_recursive(int i) {
    std::stack<int> st;
    int point = i;
  }
};

int main() {

  BinaryTree t(8);
  for (int i = 1; i <= 8; i++) {
    printf("node:%d value:%d, left:%d, right:%d \n", i, t.value(i), t.left(i), t.right(i));
  }

  printf("bfs:"); t.vist_by_bfs(1); printf("\n");

  printf("dfs:"); t.vist_by_dfs(1); printf("\n");
  printf("dfs:"); t.vist_by_dfs_iteration(1); printf("\n");

  printf("after:"); t.vist_by_after(1); printf("\n");

  printf("pre:"); t.vist_by_pre(1); printf("\n");
  printf("pre:"); t.visit_pre_ord_none_recursive(1); printf("\n");
  printf("pre:"); t.visit_by_pre_none_recursive(1); printf("\n");

  printf("mid:"); t.vist_by_middle(1); printf("\n");
  printf("mid:"); t.visit_by_middle_none_recursive(1); printf("\n");

  return 0;
}
