CREATE DATABASE clinic;

CREATE TABLE patients (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(200),
    date_of_birth date
);

CREATE TABLE treatment (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(200),
    type varchar(200)
);

CREATE TABLE medical_histories (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    admitted_at timestamp,
    patient_id INT,
    status varchar(100),
    FOREIGN KEY (patient_id) REFERENCES patients(id) 
);

CREATE TABLE invoice (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    total_amount  DECIMAL,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT, 
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    unit_price  DECIMAL,
    quntity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (treatment_id) REFERENCES treatment(id) 
);

CREATE TABLE treatment_history (
       medical_history_id  INT,
       treatment_id INT,
    PRIMARY KEY (medical_history_id, treatment_id ),
      CONSTRAINT fkey_medical_histories 
      FOREIGN KEY (medical_history_id)  
      REFERENCES medical_histories(id),
      CONSTRAINT fkey_treatment
      FOREIGN KEY (treatment_id)  
      REFERENCES treatment(id)
  
);


CREATE INDEX medical_histories_index ON  medical_histories(patient_id);
CREATE INDEX invoice_index ON  invoice(medical_history_id);
CREATE INDEX invoice_items_index ON  invoice_items(invoice_id);
CREATE INDEX treatment_index ON invoice_items(treatment_id);
CREATE INDEX medical_history_th ON  treatment_history(medical_history_id);
CREATE INDEX treatment_th ON treatment_history(treatment_id);




