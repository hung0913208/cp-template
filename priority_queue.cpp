#include <vector>
#include <functional>
#include <iostream>

using namespace std;

template<typename T>
class priority_queue { 
private:
  typedef function<bool(T&,T&)> f_cmp;

  vector<T> buffer;
  f_cmp cmp;
  int all, branch;
 
public:
  priority_queue(f_cmp compare) {
    branch = 0;
    cmp = compare;
    all = 0;
  }

  void push(T val) {
    if (all == int(buffer.size())) {
      buffer.push_back(val);
      all++;
    } else {
      buffer[all++] = val;
    }

    branch = all/2;
    refresh(false);
  }

  T get() {
    if (buffer.size() > 0)
      return buffer[0];
    else
      throw bad_alloc();
  }

  void pop() {
    refresh(true);
  }

protected:
  void refresh(bool sorting) {
    for (;;) {
      int copy_branch, left_leef, right_leef, cache;

      if (branch) {
        branch--;
      } else if (sorting) {
        if (--all) {
          swap(buffer[0], buffer[all]);
        } else {
          break;
        }
      } else {
        break;
      }

      for (copy_branch = branch; left_leef = 2*copy_branch + 1, (right_leef = left_leef + 1) < all; ) {
        copy_branch = cmp(buffer[left_leef], buffer[right_leef])? left_leef: right_leef;
      }

      if (right_leef == all) {
        copy_branch = left_leef;
      }

      while (copy_branch != branch && cmp(buffer[branch], buffer[copy_branch])) {
        copy_branch = (copy_branch + copy_branch%2)/2 - 1;
      }

      cache = copy_branch;
      while (copy_branch != branch) {
        copy_branch = (copy_branch + copy_branch%2)/2 - 1;
        swap(buffer[copy_branch], buffer[cache]);
      }


      if (branch == 0 && sorting) {
        break;
      }
    }
  }
};

int main() {
  priority_queue<int> pq([](int& l, int& r) -> bool { return l < r; });

  for (int it: vector<int>({3, 2, 1, 4, 5, 6, 7})) {
    pq.push(it);
  }

  for (int i = 0; i < 7; i++) {
    cout << pq.get() << endl;
    pq.pop();
  }
}

