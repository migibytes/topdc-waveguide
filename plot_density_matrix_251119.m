files = dir('density_matrices\*.csv');

for k = 1:length(files)
    filename = fullfile('density_matrices', files(k).name);
    data = readtable(filename);
    Z = data{:,:}
    figure('position', [0, 0, 800, 800])
    axis tight;
    b = bar3(Z);
    for k = 1:length(b)
        zdata = b(k).ZData;
        b(k).CData = zdata;
        b(k).FaceColor = 'interp';
    end
    
    states = ['111'; '112'; '121';'122';'211';'212';'221';'222']
    xticklabels(states)
    yticklabels(states)
    
    
    ax = gca
    set(ax,'fontname','Arial');
    font_size=25;
    ax.XAxis.FontSize = font_size;
    ax.YAxis.FontSize = font_size;
    ax.ZAxis.FontSize = font_size;
    z_max = max(abs(Z(:)));
    if z_max > 0.3
        zlim(ax,[-z_max,z_max]);
    else
        zlim(ax,[-0.3,0.3]);
    end
    
    exportgraphics(ax,sprintf('%s.jpg',  filename(1:end-4)),'Resolution',300)
end

% title('Density matrix (Real)','FontSize',15)
%xlabel('|\Psi_{l,m,n}\rangle','FontSize',15),'FontWeight','bold');
%ylabel('|\Psi_{l,m,n}\rangle',Z'FontSize',15,'FontWeight','bold');

%c = colorbar;
%c.Position = [0.8338 0.1100 0.0381 0.7]
%c.Label.String = 'p';


