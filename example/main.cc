#include <iostream>

#include "pcl/point_cloud.h"
#include "pcl/point_types.h"

int main(int argc, const char **argv) {
  pcl::PointCloud<pcl::PointXYZ> point_cloud;
  std::cout << "SUCCESS!" << std::endl;
  return 0;
}
