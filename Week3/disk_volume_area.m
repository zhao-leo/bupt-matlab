function [volume, surface_area] = disk_volume_area(R, h, r)  
    % R - 磁盘的半径  
    % h - 磁盘的高度  
    % r - 每个孔的半径  
    % n_holes - 孔的数量  
    n_holes=8;
    % 计算原始磁盘的体积  
    original_volume = pi * R^2 * h;  
      
    % 计算原始磁盘的表面积（包括两个底面和一个侧面）  
    original_surface_area = 2 * pi * R^2 + 2 * pi * R * h;  
      
    % 计算每个孔的体积  
    hole_volume = pi * r^2 * h;  
      
    % 计算每个孔的侧面积（不包括底面，因为底面在磁盘内部，不参与润湿）  
    hole_side_area = 2 * pi * r * h;  
    
    %计算每个孔的顶、底面积
    hole_top_buttom_area = 2 * pi * r * r;

    % 计算所有孔的总体积  
    total_hole_volume = n_holes * hole_volume;  
      
    % 计算所有孔的顶、底面积总和  
    total_hole_side_area = n_holes * hole_side_area;  
      
    % 计算所有孔的侧面积总和  
    total_hole_top_buttom_area = n_holes * hole_top_buttom_area;

    % 计算磁盘的实际体积（减去孔的体积）  
    volume = original_volume - total_hole_volume;  
      
    % 计算磁盘的实际润湿面积
    surface_area = original_surface_area + total_hole_side_area - total_hole_top_buttom_area;  
end