class SystemsController < ApplicationController
  layout false
  def overview
  end

  def power
  end

  def structural
  end

  def information
  end

  def defensive
  end

  def offensive
  end

  def transit
    @drive_config = [
      ['Configuration name:', '<i>Itera Astratis</i> (default)'],
      ['Stelleration coefficient:', '0.28215'],
      ['Compression constant:', '307.1 GeV'],
      ['Power load (% core output):', 'Minimum: 16% - Optimal: 23% - Apex: 31%'],
      ['Coil charge:', '29.291 TeV'],
      ['Field flux density (Φ/A):', '34 Tesla'], 
        # Fun fact: This is probably enough magnetic flux to make a human levitate via diamagnetism.
        # See http://physics.stackexchange.com/questions/172861/how-much-magnetic-field-will-be-required-to-levitate-a-human
      ['Drive cycle inversions:', '6038/sec'],
      ['Manifold reinforcement matrix:', 'off'],
      ['Active drive management:', 'off']
    ]
  end

  def environmental
  end
end
