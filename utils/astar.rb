class AStarPathFinder

  attr_accessor :graph

  def initialize graph
    self.graph = graph
  end

  def printList list
    list.each {|x| puts "#{x.totalCost}"}
  end

  def euclidianDistance startX, startY, finishX, finishY
    Math.hypot(finishX - startX, finishY - startY)
  end

  def findpath startX, startY, finishX, finishY

    solution = []

    nodes = graph.nodes

    startNode = nodes[startX][startY]
    finishNode = nodes[finishX][finishY]


    # Simple weights to get the first node started
    startNode.g = 0
    startNode.h = euclidianDistance(startX, startY, finishX, finishY)
    startNode.f = startNode.h

    openNodes = []
    closedNodes = []

    openNodes.push(startNode)

    while openNodes.length > 0 do

      currentNode = nil

      # find node with lowest F in open
      openNodes.each { |node|
          if currentNode.nil? || node.f < currentNode.f
            currentNode = node
          end
      }

      # Check to see if we've made it to the end
      if(currentNode.x == finishNode.x && currentNode.y == finishNode.y)
        finishNode.parentNode = currentNode.parentNode;
        #puts "Found end!"
        break;
      end

      openNodes.delete_at(openNodes.find_index(currentNode))
      closedNodes.push(currentNode);

      currentNode.connections.each {
          |node|


          nextG = currentNode.g + node.weight

          if(nextG < node.g)
            openNodes.delete_at(openNodes.find_index(node))
            closedNodes.delete_at(closedNodes.find_index(node))
          end


          if(!openNodes.include?(node) && !closedNodes.include?(node))
            node.g = nextG
            node.h = euclidianDistance(node.x, node.y, finishNode.x, finishNode.y)
            node.f = node.g + node.h
            node.parentNode = currentNode
            openNodes.push(node)
            puts "boop"
          end
      }


    end

    trailEnd = finishNode
    while(!trailEnd.parentNode.nil?) do
      solution.unshift(trailEnd)
      trailEnd = trailEnd.parentNode
    end


    solution

  end

end
