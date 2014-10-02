class AStarPathFinder

  attr_accessor :graph

  def initialize graph
    self.graph = graph
  end

  def findpath startX, startY, finishX, finishY

    solution = []

    nodes = graph.nodes

    startNode = nodes[startX][startY]
    finishNode = nodes[finishX][finishY]

    puts "Legit nodes entered, searching path"

    openNodes = []
    closedNodes = []

    openNodes.push(startNode)

    while openNodes.length > 0 do

      currentNode = openNodes.pop()

      # Check to see if we've made it to the end
      if(currentNode.x == finishNode.x && currentNode.y == finishNode.y)
        finishNode.parentNode = currentNode.parentNode;
        puts "Found end!"
        break;
      end


      # Build list of potential dudes to check
      successors = []
      puts "Checking adjacency for node #{startX},#{startY} (#{currentNode.connections.length} potential)"
      currentNode.connections.each {
          |node|

          if(!currentNode.parentNode || !(node.x == currentNode.parentNode.x && node.y == currentNode.parentNode.y))
            successors.push(node)
            puts "Node added to successors: #{node.x},#{node.y}"
          end
      }

      successors.each {
        |successor|

        index = openNodes.find_index(successor)

        if(index)
          existingNode = openNodes[index]
          if(successor.compareTo(existingNode))
            next # gotta be edgy, continue is for plebs or something
          end
        end


      }


    end

    solution

  end

end
