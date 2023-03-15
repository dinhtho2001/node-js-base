DROP TABLE IF EXISTS public.user;

CREATE TABLE public.user(
  	id SERIAL  Primary Key, 
  	username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    telephone character varying(11),
    created_at date DEFAULT now(),
    modified_at date DEFAULT now()
);

  CREATE TABLE user_address(
  	id SERIAL Primary Key, 
  	user_id integer NOT NULL , 
  	address TEXT NOT NULL, 
	city character varying(255) NOT NULL,
	district character varying(255) NOT NULL,
	ward character varying(255) NOT NULL,
	telephone character varying(11) NOT NULL,
	created_at date ,
	modified_at date,
	FOREIGN KEY (user_id) REFERENCES public.user(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
  
