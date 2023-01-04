List<int> swap(List<int> arr, int i, int j) {
  var temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;

  return arr;
}
