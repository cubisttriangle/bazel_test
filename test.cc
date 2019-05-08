#include <ignition/math.hh>

#include <iostream>

int main()
{
    ignition::math::Vector3d point1(1, 3, 5);
    ignition::math::Vector3d point2(2, 4, 6);
    double distance = point1.Distance(point2);
  
    std::cout << "Distance from " << point1 << " to " << point2 << " is "
              <<  distance << std::endl;
  
    return 0;
}
