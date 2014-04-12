class GeoLocator

  # Return if a checkoint is within bounds of a set circle
  #
  # @param   center_x
  # @param   center_y
  # @param   x
  # @param   y
  # @param   radius
  # @returns boolean
  def in_circle_bounds?( center_x, center_y, x, y, radius )
    radius = radius.to_f
    radius > distance_between_points( center_x, center_y, x, y )
  end


  # Return if a checkoint is on the border of a set circle
  #
  # @param   center_x
  # @param   center_y
  # @param   x
  # @param   y
  # @param   radius
  # @returns boolean
  def on_circle_bounds?( center_x, center_y, x, y, radius )
    radius = radius.to_f
    radius == distance_between_points( center_x, center_y, x, y )
  end


  # Return if a checkoint is out of the of a set circle
  #
  # @param   center_x
  # @param   center_y
  # @param   x
  # @param   y
  # @param   radius
  # @returns boolean
  def out_circle_bounds?( center_x, center_y, x, y, radius )
    radius = radius.to_f
    radius < distance_between_points( center_x, center_y, x, y )
  end


  # Return the distance between two points on a map
  #
  # @param   center_x
  # @param   center_y
  # @param   x
  # @param   y
  # @returns float
  def distance_between_points( center_x, center_y, x, y )
    center_x = center_x.to_f
    center_y = center_y.to_f
    GeoDistance::Haversine.geo_distance( center_x, center_y, x, y ).miles
  end

end
