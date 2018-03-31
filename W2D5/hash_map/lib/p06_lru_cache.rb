require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :map, :prc, :max, :store
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if map[key] # if key is already cached
      node_to_update = map[key]
      update_node!(node_to_update)
    else # if key has not been cached yet
      calc!(key)
    end
    map[key].val
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    eject! if count == max
    value = prc.call(key)
    store.append(key, value)
    map[key] = store.last
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node_to_update)
    node_to_update.remove
    store.append(node_to_update.key, node_to_update.val)
    map[node_to_update.key] = store.last
  end

  def eject!
    oldest_node = store.first
    oldest_node.remove
    map.delete(oldest_node.key)
  end
end
