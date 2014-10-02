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

    #puts "Legit nodes entered, searching path"

    openNodes = []
    closedNodes = []

    openNodes.push(startNode)

    while openNodes.length > 0 do

      currentNode = openNodes.pop()

      # Check to see if we've made it to the end
      if(currentNode.x == finishNode.x && currentNode.y == finishNode.y)
        finishNode.parentNode = currentNode.parentNode;
        #puts "Found end!"
        break;
      end


      # Build list of potential dudes to check
      successors = []
      #puts "Checking adjacency for node #{startX},#{startY} (#{currentNode.connections.length} potential)"
      currentNode.connections.each {
          |node|

          if(!currentNode.parentNode || !(node.x == currentNode.parentNode.x && node.y == currentNode.parentNode.y))
            successors.push(node)
           # puts "Node added to successors: #{node.x},#{node.y}"
          end
      }

      successors.each {
        |successor|

        # If we already have this in the open list we can toss it
        index = openNodes.find_index(successor)
        #puts "index: #{index}"
        if(!index.nil?)
          existingNode = openNodes[index]
          if(successor.compareTo(existingNode))
            next # gotta be edgy, continue is for plebs or something
          else
            openNodes.delete_at(index)
          end
        end

        # Same as before, but in the closed list
        index = closedNodes.find_index(successor)
        #puts "index: #{index}"
        if(!index.nil?)
          existingNode = closedNodes[index]

          if(successor.compareTo(existingNode))
            next
          else
            closedNodes.delete_at(index)
          end
        end

        # I can't get there from here
        if(!successor.passable)
          next
        end

        # If we've gotten this far, successor is a cool dude and should be checked out
        successor.parentNode = currentNode
        successor.weight = Math.hypot(finishNode.x - successor.x,finishNode.y - successor.y) # pretty naive, but whatevs for now



        openNodes.push(successor)
        openNodes.sort! { |a,b| a.weight <=> b.weight }
      }

      closedNodes.push(currentNode)
      closedNodes.sort! { |a,b| a.weight <=> b.weight }
    end

    trailEnd = finishNode
    while(!trailEnd.parentNode.nil?) do
      solution.unshift(trailEnd)
      trailEnd = trailEnd.parentNode
    end


    solution

  end

end
