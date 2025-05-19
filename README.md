### 📘 Modelo Lógico (MySQL)

#### **Tabela `CID_Subcategorias`**

| Campo     | Tipo        | Chave | Descrição                     |
| --------- | ----------- | ----- | ----------------------------- |
| subcat    | VARCHAR(10) | PK    | Código da subcategoria CID-10 |
| descricao | TEXT        |       | Descrição da subcategoria     |

#### **Tabela `Internacoes`**

| Campo       | Tipo        | Chave       | Descrição                                     |
| ----------- | ----------- | ----------- | --------------------------------------------- |
| id          | INT         | PK (AI)     | Identificador da internação (auto-incremento) |
| nasc        | DATE        |             | Data de nascimento do paciente                |
| sexo        | TINYINT     |             | Sexo (ex: 1=masc, 2=fem, etc.)                |
| qt\_diarias | INT         |             | Quantidade de diárias                         |
| diag\_princ | VARCHAR(10) | FK → subcat | Diagnóstico principal (CID-10)                |
| idade       | INT         |             | Idade do paciente                             |
| dias\_perm  | INT         |             | Dias de permanência                           |
| morte       | BOOLEAN     |             | Se houve óbito                                |
| instru      | TINYINT     |             | Grau de instrução                             |
| raca\_cor   | TINYINT     |             | Raça/cor                                      |
| car\_int    | TINYINT     |             | Característica da internação                  |
| cobranca    | TINYINT     |             | Tipo de cobrança                              |

#### 🔑 Relacionamentos

* **`Internacoes.diag_princ`** é **chave estrangeira** para **`CID_Subcategorias.subcat`**.

#### ⚙️ Observações técnicas

* `id` pode ser do tipo `INT AUTO_INCREMENT` para facilitar a inserção.
* Campos como `sexo`, `instru`, `raca_cor`, etc., podem ser normalizados com tabelas auxiliares, se necessário.
* Os tipos `TINYINT` são apropriados para codificações numéricas com poucos valores distintos (como sexo, raça, etc).
* O campo `morte` foi definido como `BOOLEAN` para representar óbito (0 = não, 1 = sim).

#### 🔎 Observações:

* `id SERIAL`: campo artificial para identificar unicamente cada linha de internação.
* `nasc`: armazenado como `DATE`. Se o dado estiver como "AAAAMMDD" em texto, será necessário converter no momento da carga.
* `diag_princ`: é uma **chave estrangeira** para `CID_Subcategorias.subcat`.
* Campos como `sexo`, `instru`, `raca_cor`, etc., podem ter tabelas auxiliares de domínio caso você deseje normalizar mais o modelo.
* `morte`: armazenado como `BOOLEAN` (0 = falso, 1 = verdadeiro).