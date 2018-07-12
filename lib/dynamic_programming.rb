require 'byebug'

class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @frog_cache =  {1 => [[1]], 2 => [[2],[1,1]], 3 => [[3],[2,1],[1,2],[1,1,1,]]}
    @super_frog_cache =  {1 => [[1]], 2 => [[2],[1,1]], 3 => [[3],[2,1],[1,2],[1,1,1,]]}
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
    odd = ((2 * (n - 1)) - 1)
    b1 = blair_nums(n-1)
    b2 = blair_nums(n-2)
    ans = b1 + b2 + odd
    @blair_cache[n] = ans
    ans
  end

  def frog_hops_bottom_up(n)
    frog_cache_builder(n)
  end

  def frog_cache_builder(n)
    return {1 => [[1]], 2 => [[2],[1,1]], 3 => [[3],[2,1],[1,2],[1,1,1,]]}[n] if n < 4
    sn1 = frog_cache_builder(n-1).map {|hops| hops << 1}
    sn2 = frog_cache_builder(n-2).map {|hops| hops << 2}
    sn3 = frog_cache_builder(n-3).map {|hops| hops << 3}
    sn1 + sn2 + sn3
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] if @frog_cache[n]
    cache1 = frog_hops_top_down_helper(n-1).map { |hop| hop + [1] }
    cache2 = frog_hops_top_down_helper(n-2).map { |hop| hop + [2] }
    cache3 = frog_hops_top_down_helper(n-3).map { |hop| hop + [3] }
    
    new_cache = cache1 + cache2 + cache3
    @frog_cache[n] = new_cache
    new_cache
  end

  def super_frog_hops(n, k)
    puts n
    puts k
  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
