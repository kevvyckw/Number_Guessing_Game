--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_guesses integer NOT NULL,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    games_played integer,
    best_game integer,
    username character varying(22)
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 10, 1);
INSERT INTO public.games VALUES (2, 1, 2);
INSERT INTO public.games VALUES (3, 411, 2);
INSERT INTO public.games VALUES (4, 857, 3);
INSERT INTO public.games VALUES (5, 305, 3);
INSERT INTO public.games VALUES (6, 67, 2);
INSERT INTO public.games VALUES (7, 801, 2);
INSERT INTO public.games VALUES (8, 473, 2);
INSERT INTO public.games VALUES (9, 1, 4);
INSERT INTO public.games VALUES (10, 213, 4);
INSERT INTO public.games VALUES (11, 497, 5);
INSERT INTO public.games VALUES (12, 483, 5);
INSERT INTO public.games VALUES (13, 770, 4);
INSERT INTO public.games VALUES (14, 583, 4);
INSERT INTO public.games VALUES (15, 985, 4);
INSERT INTO public.games VALUES (16, 807, 6);
INSERT INTO public.games VALUES (17, 708, 6);
INSERT INTO public.games VALUES (18, 407, 7);
INSERT INTO public.games VALUES (19, 579, 7);
INSERT INTO public.games VALUES (20, 348, 6);
INSERT INTO public.games VALUES (21, 539, 6);
INSERT INTO public.games VALUES (22, 983, 6);
INSERT INTO public.games VALUES (23, 1, 8);
INSERT INTO public.games VALUES (24, 474, 8);
INSERT INTO public.games VALUES (25, 36, 9);
INSERT INTO public.games VALUES (26, 151, 9);
INSERT INTO public.games VALUES (27, 345, 8);
INSERT INTO public.games VALUES (28, 347, 8);
INSERT INTO public.games VALUES (29, 451, 8);
INSERT INTO public.games VALUES (30, 668, 10);
INSERT INTO public.games VALUES (31, 705, 10);
INSERT INTO public.games VALUES (32, 529, 11);
INSERT INTO public.games VALUES (33, 920, 11);
INSERT INTO public.games VALUES (34, 220, 10);
INSERT INTO public.games VALUES (35, 881, 10);
INSERT INTO public.games VALUES (36, 284, 10);
INSERT INTO public.games VALUES (37, 1, 12);
INSERT INTO public.games VALUES (38, 725, 12);
INSERT INTO public.games VALUES (39, 84, 13);
INSERT INTO public.games VALUES (40, 584, 13);
INSERT INTO public.games VALUES (41, 441, 12);
INSERT INTO public.games VALUES (42, 990, 12);
INSERT INTO public.games VALUES (43, 455, 12);
INSERT INTO public.games VALUES (44, 1, 14);
INSERT INTO public.games VALUES (45, 538, 14);
INSERT INTO public.games VALUES (46, 1, 15);
INSERT INTO public.games VALUES (47, 234, 15);
INSERT INTO public.games VALUES (48, 944, 14);
INSERT INTO public.games VALUES (49, 599, 14);
INSERT INTO public.games VALUES (50, 643, 14);
INSERT INTO public.games VALUES (51, 133, 17);
INSERT INTO public.games VALUES (52, 365, 17);
INSERT INTO public.games VALUES (53, 706, 18);
INSERT INTO public.games VALUES (54, 404, 18);
INSERT INTO public.games VALUES (55, 469, 17);
INSERT INTO public.games VALUES (56, 840, 17);
INSERT INTO public.games VALUES (57, 381, 17);
INSERT INTO public.games VALUES (58, 1, 19);
INSERT INTO public.games VALUES (59, 66, 19);
INSERT INTO public.games VALUES (60, 623, 20);
INSERT INTO public.games VALUES (61, 403, 20);
INSERT INTO public.games VALUES (62, 929, 19);
INSERT INTO public.games VALUES (63, 736, 19);
INSERT INTO public.games VALUES (64, 88, 19);
INSERT INTO public.games VALUES (65, 78, 21);
INSERT INTO public.games VALUES (66, 942, 21);
INSERT INTO public.games VALUES (67, 500, 22);
INSERT INTO public.games VALUES (68, 893, 22);
INSERT INTO public.games VALUES (69, 833, 21);
INSERT INTO public.games VALUES (70, 421, 21);
INSERT INTO public.games VALUES (71, 373, 21);
INSERT INTO public.games VALUES (72, 224, 23);
INSERT INTO public.games VALUES (73, 930, 23);
INSERT INTO public.games VALUES (74, 1, 24);
INSERT INTO public.games VALUES (75, 390, 24);
INSERT INTO public.games VALUES (76, 209, 23);
INSERT INTO public.games VALUES (77, 735, 23);
INSERT INTO public.games VALUES (78, 976, 23);
INSERT INTO public.games VALUES (79, 472, 25);
INSERT INTO public.games VALUES (80, 353, 25);
INSERT INTO public.games VALUES (81, 885, 26);
INSERT INTO public.games VALUES (82, 353, 26);
INSERT INTO public.games VALUES (83, 596, 25);
INSERT INTO public.games VALUES (84, 40, 25);
INSERT INTO public.games VALUES (85, 738, 25);
INSERT INTO public.games VALUES (86, 765, 27);
INSERT INTO public.games VALUES (87, 476, 27);
INSERT INTO public.games VALUES (88, 427, 28);
INSERT INTO public.games VALUES (89, 749, 28);
INSERT INTO public.games VALUES (90, 296, 27);
INSERT INTO public.games VALUES (91, 866, 27);
INSERT INTO public.games VALUES (92, 678, 27);
INSERT INTO public.games VALUES (93, 1, 29);
INSERT INTO public.games VALUES (94, 563, 29);
INSERT INTO public.games VALUES (95, 385, 30);
INSERT INTO public.games VALUES (96, 621, 30);
INSERT INTO public.games VALUES (97, 514, 29);
INSERT INTO public.games VALUES (98, 220, 29);
INSERT INTO public.games VALUES (99, 610, 29);
INSERT INTO public.games VALUES (100, 879, 31);
INSERT INTO public.games VALUES (101, 301, 31);
INSERT INTO public.games VALUES (102, 213, 32);
INSERT INTO public.games VALUES (103, 840, 32);
INSERT INTO public.games VALUES (104, 234, 31);
INSERT INTO public.games VALUES (105, 86, 31);
INSERT INTO public.games VALUES (106, 209, 31);
INSERT INTO public.games VALUES (107, 59, 33);
INSERT INTO public.games VALUES (108, 179, 33);
INSERT INTO public.games VALUES (109, 950, 34);
INSERT INTO public.games VALUES (110, 337, 34);
INSERT INTO public.games VALUES (111, 683, 33);
INSERT INTO public.games VALUES (112, 719, 33);
INSERT INTO public.games VALUES (113, 71, 33);
INSERT INTO public.games VALUES (114, 1, 35);
INSERT INTO public.games VALUES (115, 488, 35);
INSERT INTO public.games VALUES (116, 1, 36);
INSERT INTO public.games VALUES (117, 142, 36);
INSERT INTO public.games VALUES (118, 689, 35);
INSERT INTO public.games VALUES (119, 622, 35);
INSERT INTO public.games VALUES (120, 879, 35);
INSERT INTO public.games VALUES (121, 979, 37);
INSERT INTO public.games VALUES (122, 485, 37);
INSERT INTO public.games VALUES (123, 445, 38);
INSERT INTO public.games VALUES (124, 241, 38);
INSERT INTO public.games VALUES (125, 479, 37);
INSERT INTO public.games VALUES (126, 833, 37);
INSERT INTO public.games VALUES (127, 64, 37);
INSERT INTO public.games VALUES (128, 1, 39);
INSERT INTO public.games VALUES (129, 406, 39);
INSERT INTO public.games VALUES (130, 274, 40);
INSERT INTO public.games VALUES (131, 231, 40);
INSERT INTO public.games VALUES (132, 389, 39);
INSERT INTO public.games VALUES (133, 417, 39);
INSERT INTO public.games VALUES (134, 238, 39);
INSERT INTO public.games VALUES (135, 262, 41);
INSERT INTO public.games VALUES (136, 966, 41);
INSERT INTO public.games VALUES (137, 711, 42);
INSERT INTO public.games VALUES (138, 559, 42);
INSERT INTO public.games VALUES (139, 165, 41);
INSERT INTO public.games VALUES (140, 995, 41);
INSERT INTO public.games VALUES (141, 19, 41);
INSERT INTO public.games VALUES (142, 685, 43);
INSERT INTO public.games VALUES (143, 407, 43);
INSERT INTO public.games VALUES (144, 485, 44);
INSERT INTO public.games VALUES (145, 922, 44);
INSERT INTO public.games VALUES (146, 804, 43);
INSERT INTO public.games VALUES (147, 60, 43);
INSERT INTO public.games VALUES (148, 766, 43);
INSERT INTO public.games VALUES (149, 1, 45);
INSERT INTO public.games VALUES (150, 97, 45);
INSERT INTO public.games VALUES (151, 1, 46);
INSERT INTO public.games VALUES (152, 211, 46);
INSERT INTO public.games VALUES (153, 611, 45);
INSERT INTO public.games VALUES (154, 5, 45);
INSERT INTO public.games VALUES (155, 811, 45);
INSERT INTO public.games VALUES (156, 992, 47);
INSERT INTO public.games VALUES (157, 183, 47);
INSERT INTO public.games VALUES (158, 916, 48);
INSERT INTO public.games VALUES (159, 913, 48);
INSERT INTO public.games VALUES (160, 618, 47);
INSERT INTO public.games VALUES (161, 875, 47);
INSERT INTO public.games VALUES (162, 52, 47);
INSERT INTO public.games VALUES (163, 1, 49);
INSERT INTO public.games VALUES (164, 950, 49);
INSERT INTO public.games VALUES (165, 590, 50);
INSERT INTO public.games VALUES (166, 467, 50);
INSERT INTO public.games VALUES (167, 359, 49);
INSERT INTO public.games VALUES (168, 49, 49);
INSERT INTO public.games VALUES (169, 230, 49);
INSERT INTO public.games VALUES (170, 601, 51);
INSERT INTO public.games VALUES (171, 328, 51);
INSERT INTO public.games VALUES (172, 84, 52);
INSERT INTO public.games VALUES (173, 506, 52);
INSERT INTO public.games VALUES (174, 674, 51);
INSERT INTO public.games VALUES (175, 238, 51);
INSERT INTO public.games VALUES (176, 160, 51);
INSERT INTO public.games VALUES (177, 103, 53);
INSERT INTO public.games VALUES (178, 495, 53);
INSERT INTO public.games VALUES (179, 20, 54);
INSERT INTO public.games VALUES (180, 64, 54);
INSERT INTO public.games VALUES (181, 834, 53);
INSERT INTO public.games VALUES (182, 915, 53);
INSERT INTO public.games VALUES (183, 431, 53);
INSERT INTO public.games VALUES (184, 949, 55);
INSERT INTO public.games VALUES (185, 377, 55);
INSERT INTO public.games VALUES (186, 664, 56);
INSERT INTO public.games VALUES (187, 658, 56);
INSERT INTO public.games VALUES (188, 29, 55);
INSERT INTO public.games VALUES (189, 143, 55);
INSERT INTO public.games VALUES (190, 213, 55);
INSERT INTO public.games VALUES (191, 1, 57);
INSERT INTO public.games VALUES (192, 616, 57);
INSERT INTO public.games VALUES (193, 293, 58);
INSERT INTO public.games VALUES (194, 356, 58);
INSERT INTO public.games VALUES (195, 290, 57);
INSERT INTO public.games VALUES (196, 752, 57);
INSERT INTO public.games VALUES (197, 692, 57);
INSERT INTO public.games VALUES (198, 365, 59);
INSERT INTO public.games VALUES (199, 30, 59);
INSERT INTO public.games VALUES (200, 448, 60);
INSERT INTO public.games VALUES (201, 332, 60);
INSERT INTO public.games VALUES (202, 325, 59);
INSERT INTO public.games VALUES (203, 280, 59);
INSERT INTO public.games VALUES (204, 182, 59);
INSERT INTO public.games VALUES (205, 1, 61);
INSERT INTO public.games VALUES (206, 149, 61);
INSERT INTO public.games VALUES (207, 962, 62);
INSERT INTO public.games VALUES (208, 728, 62);
INSERT INTO public.games VALUES (209, 627, 61);
INSERT INTO public.games VALUES (210, 181, 61);
INSERT INTO public.games VALUES (211, 575, 61);
INSERT INTO public.games VALUES (212, 1, 63);
INSERT INTO public.games VALUES (213, 1, 63);
INSERT INTO public.games VALUES (214, 173, 65);
INSERT INTO public.games VALUES (215, 617, 65);
INSERT INTO public.games VALUES (216, 393, 63);
INSERT INTO public.games VALUES (217, 443, 63);
INSERT INTO public.games VALUES (218, 445, 63);
INSERT INTO public.games VALUES (219, 445, 66);
INSERT INTO public.games VALUES (220, 211, 66);
INSERT INTO public.games VALUES (221, 255, 67);
INSERT INTO public.games VALUES (222, 870, 67);
INSERT INTO public.games VALUES (223, 689, 66);
INSERT INTO public.games VALUES (224, 217, 66);
INSERT INTO public.games VALUES (225, 800, 66);


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES (1, 427, 'user_1683599003825');
INSERT INTO public.user_info VALUES (3, 259, 'user_1683599003826');
INSERT INTO public.user_info VALUES (2, 3, 'Kevin');
INSERT INTO public.user_info VALUES (1, 454, 'user_1683599072456');
INSERT INTO public.user_info VALUES (2, 92, 'user_1683599072457');
INSERT INTO public.user_info VALUES (2, 42, 'user_1683599129244');
INSERT INTO public.user_info VALUES (3, 163, 'user_1683599129245');
INSERT INTO public.user_info VALUES (1, 223, 'user_1683599186093');
INSERT INTO public.user_info VALUES (3, 127, 'user_1683599186094');
INSERT INTO public.user_info VALUES (1, 3, 'user_1667755946176');
INSERT INTO public.user_info VALUES (2, 379, 'user_1683598845223');
INSERT INTO public.user_info VALUES (3, 159, 'user_1683598845224');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Maria');
INSERT INTO public.users VALUES (2, 'user_1683600400460');
INSERT INTO public.users VALUES (3, 'user_1683600400459');
INSERT INTO public.users VALUES (4, 'user_1683600431713');
INSERT INTO public.users VALUES (5, 'user_1683600431712');
INSERT INTO public.users VALUES (6, 'user_1683600473640');
INSERT INTO public.users VALUES (7, 'user_1683600473639');
INSERT INTO public.users VALUES (8, 'user_1683600488909');
INSERT INTO public.users VALUES (9, 'user_1683600488908');
INSERT INTO public.users VALUES (10, 'user_1683600508304');
INSERT INTO public.users VALUES (11, 'user_1683600508303');
INSERT INTO public.users VALUES (12, 'user_1683600544249');
INSERT INTO public.users VALUES (13, 'user_1683600544248');
INSERT INTO public.users VALUES (14, 'user_1683600562665');
INSERT INTO public.users VALUES (15, 'user_1683600562664');
INSERT INTO public.users VALUES (17, 'user_1683600583158');
INSERT INTO public.users VALUES (18, 'user_1683600583157');
INSERT INTO public.users VALUES (19, 'user_1683600600413');
INSERT INTO public.users VALUES (20, 'user_1683600600412');
INSERT INTO public.users VALUES (21, 'user_1683600610627');
INSERT INTO public.users VALUES (22, 'user_1683600610626');
INSERT INTO public.users VALUES (23, 'user_1683600620008');
INSERT INTO public.users VALUES (24, 'user_1683600620007');
INSERT INTO public.users VALUES (25, 'user_1683600630562');
INSERT INTO public.users VALUES (26, 'user_1683600630561');
INSERT INTO public.users VALUES (27, 'user_1683600639916');
INSERT INTO public.users VALUES (28, 'user_1683600639915');
INSERT INTO public.users VALUES (29, 'user_1683600686418');
INSERT INTO public.users VALUES (30, 'user_1683600686417');
INSERT INTO public.users VALUES (31, 'user_1683600699198');
INSERT INTO public.users VALUES (32, 'user_1683600699197');
INSERT INTO public.users VALUES (33, 'user_1683600719042');
INSERT INTO public.users VALUES (34, 'user_1683600719041');
INSERT INTO public.users VALUES (35, 'user_1683600734558');
INSERT INTO public.users VALUES (36, 'user_1683600734557');
INSERT INTO public.users VALUES (37, 'user_1683600766575');
INSERT INTO public.users VALUES (38, 'user_1683600766574');
INSERT INTO public.users VALUES (39, 'user_1683600804260');
INSERT INTO public.users VALUES (40, 'user_1683600804259');
INSERT INTO public.users VALUES (41, 'user_1683600847095');
INSERT INTO public.users VALUES (42, 'user_1683600847094');
INSERT INTO public.users VALUES (43, 'user_1683600861585');
INSERT INTO public.users VALUES (44, 'user_1683600861584');
INSERT INTO public.users VALUES (45, 'user_1683600899461');
INSERT INTO public.users VALUES (46, 'user_1683600899460');
INSERT INTO public.users VALUES (47, 'user_1683600917328');
INSERT INTO public.users VALUES (48, 'user_1683600917327');
INSERT INTO public.users VALUES (49, 'user_1683600935161');
INSERT INTO public.users VALUES (50, 'user_1683600935160');
INSERT INTO public.users VALUES (51, 'user_1683600946457');
INSERT INTO public.users VALUES (52, 'user_1683600946456');
INSERT INTO public.users VALUES (53, 'user_1683600959446');
INSERT INTO public.users VALUES (54, 'user_1683600959445');
INSERT INTO public.users VALUES (55, 'user_1683600972680');
INSERT INTO public.users VALUES (56, 'user_1683600972679');
INSERT INTO public.users VALUES (57, 'user_1683600991323');
INSERT INTO public.users VALUES (58, 'user_1683600991322');
INSERT INTO public.users VALUES (59, 'user_1683601003362');
INSERT INTO public.users VALUES (60, 'user_1683601003361');
INSERT INTO public.users VALUES (61, 'user_1683601020354');
INSERT INTO public.users VALUES (62, 'user_1683601020353');
INSERT INTO public.users VALUES (63, 'user_1683601043336');
INSERT INTO public.users VALUES (65, 'user_1683601043335');
INSERT INTO public.users VALUES (66, 'user_1683601088972');
INSERT INTO public.users VALUES (67, 'user_1683601088971');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 225, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 67, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

