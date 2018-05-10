function e = escape(T)
    global MOLECULES
    global PLANET
    e = (T ./ (MOLECULES.M_mol(4) * PLANET.v_escape)) * 0.05;
end