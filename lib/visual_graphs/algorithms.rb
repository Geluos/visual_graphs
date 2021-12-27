require_relative 'weighted_graph'

module  VisualGraphs
  #Algorihtms class for Visual Graph
  class Algorithms

    def init
      #infinity value
      @inf = 1000000000
    end


    def check_graph_for_dijkstra(wh_gr, start)

      #Check class of input value
      unless wh_gr.is_a?(WeightedGraph) or all_weight_positive(wh_gr)
        raise WrongParamsForAlgorithm
      end

      if start < 0 or start > wh_gr.length
        raise WrongParamsForAlgorithm
      end

    end

    def all_weight_positive(wh_gr)
      wh_gr[v].each do |t|
        if t.last <= 0
          return false
        end
      end
      true
    end

    #Dijkstra alg
    # return distance from spec vertex for others
    # start vertex nums from 0
    def dijkstra(wh_gr, start)

      check_graph_for_dijkstra(wh_gr, start)

      number_of_element = wh_gr.adjacency_list.length
      dist = Array.new(number_of_element, @inf)
      u = Array.new(number_of_element, false)

      dist[start] = 0

      number_of_element.times do
        v = -1
        [0..number_of_element-1].each { |j|
          if not u[j] and (v == -1 or d[j] < d[v])
            v = j
          end
        }

        u[v] = true

        wh_gr[v].each_with_index { |g, index|

          if dist[v] + g.last < dist[index]
            dist[to] = dist[v] + g.last
          end
        }
      end
      dist

    end

  end
end


