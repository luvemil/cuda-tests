#include <stdlib.h>
#include <vector>
#include <thrust/host_vector.h>
#include <thrust/device_vector.h>
#include <thrust/generate.h>
#include <thrust/sort.h>
#include <thrust/copy.h>
#include <algorithm>

int main(int argc, char **argv)
{
  thrust::host_vector<int> h_vec(100);
  std::vector<int> a_std(100);

  thrust::generate(h_vec.begin(), h_vec.end(), rand);
  thrust::copy(h_vec.begin(), h_vec.end(), a_std.begin());

  printf("%d\n", a_std[0]);

  return 0;
}
