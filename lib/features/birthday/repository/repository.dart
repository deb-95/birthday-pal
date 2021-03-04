abstract class Repository<T> {
  List<T> getAll();
  Future<int> create(T el);
  Future<void> edit(T el, int id);
  Future<void> delete(int id);
}
