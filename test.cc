#include <ignition/math.hh>
//#include <ignition/msgs.hh>

#include <iostream>

int main()
{
    ignition::math::Vector3d point1(1, 3, 5);
    ignition::math::Vector3d point2(2, 4, 6);
    double distance = point1.Distance(point2);
  
    std::cout << "Distance from " << point1 << " to " << point2 << " is "
              <<  distance << std::endl;
  
/*
    ignition::msgs::Vector3d mp1 = ignition::msgs::Convert( point1 );
    ignition::msgs::Vector3d mp2 = ignition::msgs::Convert( point2 );

    std::cout << "msgs::mp1:\n" << mp1.DebugString() << std::endl;
    std::cout << "msgs::mp2:\n" << mp2.DebugString() << std::endl;
*/

    return 0;
}
