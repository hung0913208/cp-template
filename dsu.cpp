#include <iostream>
#include <vector>

using namespace std;

template <typename T> class dsu {
private:
  vector<int> parent, size;

protected:
  virtual bool mergeable(int l, int r) = 0;
  virtual void gather(int owner, T val) = 0;
  virtual T calculate(int owner) = 0;

public:
  dsu(int n) : parent(n), size(n) {
    for (int i = 0; i < n; i++)
      make(i, nullptr);
  };

  void make(int owner, T val) { make(owner, &val); }

  int find(int v) { return v == parent[v] ? v : parent[v] = find(parent[v]); }

  bool join(int a, int b) {
    a = find(a);
    b = find(b);

    if (a != b) {
      if (mergeable(a, b)) {
        if (size[a] < size[b])
          swap(a, b);

        parent[b] = a;
        size[a] += size[b];

        gather(a, calculate(b));
      }

      return true;
    } else {
      cout << a << ' ' << b << endl;
      return false;
    }
  }

private:
  void make(int owner, T *val) {
    parent[owner] = owner;
    size[owner] = 1;

    if (val)
      gather(owner, *val);
  }
};

class test : public dsu<int> {
private:
  vector<int> sum;

  bool mergeable(int l, int r) { return true; }

  void gather(int owner, int val) { sum[owner] += val; }

  int calculate(int owner) { return sum[owner]; }

public:
  test(int n) : dsu<int>(n) { sum.resize(n); }
};

int main(int argc, char *argv[]) {
  test t(10);

  t.join(1, 2);
  t.join(3, 4);
  t.join(1, 3);
  t.join(4, 5);
  cout << t.find(5) << endl;
  return 0;
}
