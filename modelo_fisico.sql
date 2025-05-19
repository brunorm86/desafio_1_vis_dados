CREATE TABLE CID_Subcategorias (
    subcat VARCHAR(10) PRIMARY KEY,
    descricao TEXT
);

CREATE TABLE Internacoes (
    id SERIAL PRIMARY KEY,
    nasc DATE,
    sexo INTEGER,
    qt_diarias INTEGER,
    diag_princ VARCHAR(10),
    idade INTEGER,
    dias_perm INTEGER,
    morte BOOLEAN,
    instru INTEGER,
    raca_cor INTEGER,
    car_int INTEGER,
    cobranca INTEGER,
    FOREIGN KEY (diag_princ) REFERENCES CID_Subcategorias(subcat)
);