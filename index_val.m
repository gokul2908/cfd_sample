function index_val = index_val(a,x)
    
    for i = 1:length(a)
         if a(i)>=x
             index_val = i
             break
         end
    end
end