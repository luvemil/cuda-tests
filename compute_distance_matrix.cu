#include <stdlib.h>
#include <gudhi/reader_utils.h>
#include <vector>
#include <algorithm>

#define PT_SIZE 8

// define the types
typedef int Vertex_handle;
typedef double Filtration_value;
typedef std::pair< Vertex_handle, Vertex_handle > Edge_t;
typedef std::vector<double> Point_t;

typedef std::vector< Edge_t > Edges_v;
typedef std::vector< Filtration_value > Filtration_values_v;
typedef std::vector< Point_t > PointCloud;

__global__ void parallel_distance(float **Points, int pt_dim, int pt_n, int *edges,
  double *filt_value, float threshold_q)
{
  int idx = threadIdx.x;
  float me[PT_SIZE];
  for(int i=0; i<pt_dim; i++)
    me[i] = Points[idx*pt_dim + i];

  for(int t=idx+1; t<pt_n; t++)
  {
    float dist_q = 0;
    for(int i=0; i<pt_dim; i++)
    {
      dist_q += fabs(me[i] - Points[t][i]);
      if(dist_q > threshold_q)
      {
        dist_q = -1;
        break;
      }
    }

    if(dist_q > 0)
    {
      int ix = idx * pt_dim + t - 1;
      edges[ix] = 1;
      filt_value[ix] = sqrt(dist_q);
    }
  }
}

void compute_distance_matrix(Edges_v &edges, Filtration_values_v &edges_fil,
  PointCloud &points, Filtration_value threshold)
{
}

int main()
{
  PointCloud points;
  read_points("/home/marco/repos/gudhi/2016-04-15-17-35-51_GUDHI_1.3.0/data/points/Kl.txt",points);

  return 0;
}
