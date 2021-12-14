#ifndef CP_SEGMENT_TREE_H_
#define CP_SEGMENT_TREE_H_

template <typename T>
class SegmentTree {
public: 
  SegmentTree(int n) { resize(n); }
  SegmentTree() {}

  void resize(int n) {
    _st.resize(2*n + 1, 0);
    _n = n;
  }

  void update(int i, T v) {
    _st[_n + i] = v;
    
    for (int j = (_n + i) / 2; j > 0; j /= 2) {
      if (2*j + 1 <= 2*_n)
        _st[j] = op(_st[2*j], _st[2*j + 1]);
      else
        _st[j] = _st[2*j];
    }
  }

  T query(int l, int r) {
    int ans = 0;

    l += _n;
    r += _n;

    while (l <= r) {
      if (l % 2 == 1) 
        ans = op(ans, _st[l++]);

      if (r % 2 == 0)
        ans = op(ans, _st[r--]);

      l /= 2;
      r /= 2;
    }

    return ans;
  }

  const vector<T>& getArrays() {
    return _st;
  }

protected:
  virtual int op(T l, T r) = 0;

private:
  vector<T> _st;
  int _n;
};
#endif  // CP_SEGMENT_TREE_H_
