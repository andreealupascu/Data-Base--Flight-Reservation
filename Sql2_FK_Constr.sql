USE Rezervari_Zboruri
GO
ALTER TABLE Bilet
ADD CONSTRAINT FK_Pasageri_Bilet FOREIGN KEY (Id_Pasager)
REFERENCES Pasager(Id_Pasager);
GO
ALTER TABLE Bilet
ADD CONSTRAINT FK_Zbor_Bilet FOREIGN KEY (Id_Zbor)
REFERENCES Zbor(Id_Zbor);
GO
ALTER TABLE Bilet
ADD CONSTRAINT FK_Zbor_Loc FOREIGN KEY (Id_Loc)
REFERENCES Loc(Id_Loc);
GO
ALTER TABLE Bilet
ADD CONSTRAINT FK_Zbor_Bagaj FOREIGN KEY (Id_Bagaje)
REFERENCES Bagaje(Id_Bagaje);
GO
ALTER TABLE Zbor
ADD CONSTRAINT FK_Companie_Zbor FOREIGN KEY (Id_Companie)
REFERENCES Companie_Aeriana(Id_Companie);
GO
ALTER TABLE Zbor
ADD CONSTRAINT FK_Zbor_Sursa FOREIGN KEY (Id_Sursa)
REFERENCES Locatie(Id_Locatie);
GO
ALTER TABLE Zbor
ADD CONSTRAINT FK_Zbor_Destinatie FOREIGN KEY (Id_Destinatie)
REFERENCES Locatie(Id_Locatie);
GO
ALTER TABLE Locatie_Companie
ADD CONSTRAINT FK_Loc_Comp_Loc FOREIGN KEY (Id_Locatie)
REFERENCES Locatie(Id_Locatie);
GO
ALTER TABLE Locatie_Companie
ADD CONSTRAINT FK_Loc_Comp_Comp FOREIGN KEY (Id_Companie)
REFERENCES Companie_Aeriana(Id_Companie);
GO
ALTER TABLE Avion
ADD CONSTRAINT FK_Avion_Marca FOREIGN KEY (Id_Marca)
REFERENCES Avion_Marca(Id_Marca);
GO
ALTER TABLE Avion
ADD CONSTRAINT FK_Avion_Comp FOREIGN KEY (Id_Companie)
REFERENCES Companie_Aeriana(Id_Companie);
GO

-- constrangeri
USE Rezervari_Zboruri
GO
ALTER TABLE Companie_Aeriana
ADD CONSTRAINT Con_Uniq_loc Unique(Nume_Companie);
GO

ALTER TABLE Locatie
ADD CONSTRAINT Con_Uniq_location Unique(Oras);
GO

ALTER TABLE Loc 
ADD CONSTRAINT check_pret_loc CHECK (Pret_Loc>0)
GO

ALTER TABLE Bagaje 
ADD CONSTRAINT check_pret_bagaj CHECK (Pret_Bagaj>0)
GO

ALTER TABLE Bilet
ADD CONSTRAINT check_pret_bilet CHECK (Pret_Bilet>=0)
GO

ALTER TABLE Avion_Marca 
ADD CONSTRAINT check_nr_locuri CHECK (Nr_Locuri<=400)
GO

ALTER TABLE Zbor
ADD CONSTRAINT check_data_decolarii CHECK (datediff(day, Data_decolarii,getdate())>1)
GO

ALTER TABLE Pasager 
ADD CONSTRAINT check_data_nasterii CHECK (datediff(day, Data_nasterii, getdate())>14)
GO

ALTER TABLE Bilet
ADD CONSTRAINT check_data_cumpararii CHECK (datediff(day, Data_Cumpararii, getdate())>1)
GO

ALTER TABLE Pasager
ADD CONSTRAINT check_sex CHECK (Sex='M' or Sex='F')
GO

ALTER TABLE Bagaje
ADD CONSTRAINT check_tip_bagaj CHECK (Tip_Bagaj='mana' or Tip_Bagaj='10kg' or Tip_Bagaj='20kg' or Tip_Bagaj='23kg' or Tip_Bagaj='32kg')
GO

ALTER TABLE Loc
ADD CONSTRAINT check_tip_loc CHECK (Tip_Loc='geam' or Tip_Loc='mijloc' or Tip_Loc='margine' or Tip_Loc='extr_large' or Tip_Loc='Business')

ALTER TABLE Locatie ALTER COLUMN Oras varchar(20); 
ALTER TABLE Locatie ALTER COLUMN Tara varchar(20); 
