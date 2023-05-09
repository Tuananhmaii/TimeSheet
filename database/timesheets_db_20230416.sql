--
-- PostgreSQL database dump
--

-- Dumped from database version 11.14
-- Dumped by pg_dump version 11.14

-- Started on 2023-04-17 16:59:20

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

--
-- TOC entry 2878 (class 1262 OID 32415)
-- Name: Timesheets_System; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Timesheets_System" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE "Timesheets_System" OWNER TO postgres;

\connect "Timesheets_System"

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

--
-- TOC entry 219 (class 1255 OID 32550)
-- Name: update_time_when_duplicate_fullname_and_date(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_time_when_duplicate_fullname_and_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF EXISTS (SELECT * FROM timesheets_details_tb t WHERE NEW.fullname = t.fullname AND NEW.date = t.date) THEN
		UPDATE timesheets_details_tb
		SET checkin = NEW.checkin, checkout = NEW.checkout, working_hours = NEW.working_hours
		WHERE Timesheets_details_tb.fullname = NEW.fullname AND timesheets_details_tb.date = NEW.date;
        RETURN NULL;
	ELSE
		--INSERT INTO timesheets_details_tb (fullname, date, checkin, checkout, working_hours)
		--VALUES (NEW.fullname, NEW.date, NEW.checkin, NEW.checkout, NEW.working_hours);
	END IF;
	RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_time_when_duplicate_fullname_and_date() OWNER TO postgres;

--
-- TOC entry 206 (class 1255 OID 32417)
-- Name: update_total_working_hours_and_days(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_total_working_hours_and_days() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
BEGIN
    NEW.total_working_hours := COALESCE(NEW.D1, 0) + COALESCE(NEW.D2, 0) + COALESCE(NEW.D3, 0) + COALESCE(NEW.D4, 0) + COALESCE(NEW.D5, 0) + COALESCE(NEW.D6, 0) + COALESCE(NEW.D7, 0) + 
    COALESCE(NEW.D8, 0) + COALESCE(NEW.D9, 0) + COALESCE(NEW.D10, 0) + COALESCE(NEW.D11, 0) + COALESCE(NEW.D12, 0) + COALESCE(NEW.D13, 0) + COALESCE(NEW.D14, 0) + COALESCE(NEW.D15, 0) + 
    COALESCE(NEW.D16, 0) + COALESCE(NEW.D17, 0) + COALESCE(NEW.D18, 0) + COALESCE(NEW.D19, 0) + COALESCE(NEW.D20, 0) + COALESCE(NEW.D21, 0) + COALESCE(NEW.D22, 0) + COALESCE(NEW.D23, 0) + 
    COALESCE(NEW.D24, 0) + COALESCE(NEW.D25, 0) + COALESCE(NEW.D26, 0) + COALESCE(NEW.D27, 0) + COALESCE(NEW.D28, 0) + COALESCE(NEW.D29, 0) + COALESCE(NEW.D30, 0) + COALESCE(NEW.D31, 0);
    NEW.total_working_days := (CASE WHEN NEW.d1 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d2 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d3 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d4 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d5 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d6 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d7 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d8 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d9 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d10 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d11 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d12 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d13 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d14 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d15 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d16 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d17 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d18 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d19 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d20 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d21 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d22 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d23 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d24 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d25 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d26 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d27 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d28 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d29 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d30 > 0 THEN 1 ELSE 0 END) + (CASE WHEN NEW.d31 > 0 THEN 1 ELSE 0 END);
    RETURN NEW;
END;
END;$$;


ALTER FUNCTION public.update_total_working_hours_and_days() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 32418)
-- Name: auth_group_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_tb (
    auth_group_id character varying(20) NOT NULL,
    auth_group_name character varying(50)
);


ALTER TABLE public.auth_group_tb OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 32421)
-- Name: department_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department_tb (
    department_id character varying(20) NOT NULL,
    department_name character varying(50)
);


ALTER TABLE public.department_tb OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 32424)
-- Name: member_of_team_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member_of_team_tb (
    team_id character varying(20) NOT NULL,
    member_id character varying(50) NOT NULL,
    "position" character varying(20)
);


ALTER TABLE public.member_of_team_tb OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 32427)
-- Name: screen_auth_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.screen_auth_tb (
    auth_group_id character varying(20) NOT NULL,
    screen_id character varying(30) NOT NULL,
    allowed_to_open character varying(1)
);


ALTER TABLE public.screen_auth_tb OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 32430)
-- Name: screen_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.screen_tb (
    screen_id character varying(30) NOT NULL,
    screen_name character varying(100)
);


ALTER TABLE public.screen_tb OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 32433)
-- Name: team_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_tb (
    team_id character varying(20) NOT NULL,
    department_id character varying(20),
    team_name character varying(50)
);


ALTER TABLE public.team_tb OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 32436)
-- Name: timesheets_details_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timesheets_details_tb (
    username character varying(50),
    fullname character varying(100) NOT NULL,
    date date NOT NULL,
    checkin timestamp without time zone,
    checkout timestamp without time zone,
    working_hours numeric(4,1)
);


ALTER TABLE public.timesheets_details_tb OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 32439)
-- Name: timesheets_raw_data_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timesheets_raw_data_tb (
    fullname character varying(100),
    in_out_time timestamp without time zone
);


ALTER TABLE public.timesheets_raw_data_tb OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 32442)
-- Name: timesheets_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timesheets_tb (
    username character varying(50) NOT NULL,
    fullname character varying(100),
    year integer NOT NULL,
    month integer NOT NULL,
    d1 numeric(3,1),
    d2 numeric(3,1),
    d3 numeric(3,1),
    d4 numeric(3,1),
    d5 numeric(3,1),
    d6 numeric(3,1),
    d7 numeric(3,1),
    d8 numeric(3,1),
    d9 numeric(3,1),
    d10 numeric(3,1),
    d11 numeric(3,1),
    d12 numeric(3,1),
    d13 numeric(3,1),
    d14 numeric(3,1),
    d15 numeric(3,1),
    d16 numeric(3,1),
    d17 numeric(3,1),
    d18 numeric(3,1),
    d19 numeric(3,1),
    d20 numeric(3,1),
    d21 numeric(3,1),
    d22 numeric(3,1),
    d23 numeric(3,1),
    d24 numeric(3,1),
    d25 numeric(3,1),
    d26 numeric(3,1),
    d27 numeric(3,1),
    d28 numeric(3,1),
    d29 numeric(3,1),
    d30 numeric(3,1),
    d31 numeric(3,1),
    total_working_days numeric(3,1),
    total_working_hours numeric(4,1)
);


ALTER TABLE public.timesheets_tb OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 32445)
-- Name: user_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_tb (
    username character varying(50) NOT NULL,
    password character varying(50),
    fullname character varying(50),
    gender bit varying(1),
    birth_date date,
    email character varying(100),
    phone character varying(20),
    address character varying(200),
    ethnic character varying(10),
    religion character varying(10),
    citizen_id character varying(10),
    tax_code character varying(10),
    social_insurance_no character varying(10),
    photo character varying,
    date_hired date,
    contract_no character varying(10),
    auth_group_id character varying(20)
);


ALTER TABLE public.user_tb OWNER TO postgres;

--
-- TOC entry 2863 (class 0 OID 32418)
-- Dependencies: 196
-- Data for Name: auth_group_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_group_tb (auth_group_id, auth_group_name) VALUES ('Admin', 'Administrator');
INSERT INTO public.auth_group_tb (auth_group_id, auth_group_name) VALUES ('User', 'User');


--
-- TOC entry 2864 (class 0 OID 32421)
-- Dependencies: 197
-- Data for Name: department_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.department_tb (department_id, department_name) VALUES ('DEV', 'Development');
INSERT INTO public.department_tb (department_id, department_name) VALUES ('BOD', 'BOD');
INSERT INTO public.department_tb (department_id, department_name) VALUES ('General', 'Human Resource');


--
-- TOC entry 2865 (class 0 OID 32424)
-- Dependencies: 198
-- Data for Name: member_of_team_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('NET', 'ThanhDD', 'Member');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('BOD', 'ThaoLS', 'BOD');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('JAVA', 'ThienLTH', 'PM');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('JAVA', 'ChuongLV', 'Member');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('HR', 'VyTTH', 'Member');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('NET', 'DatTC', 'Member');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('Comtor', 'SangLT', 'PM');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('PHP', 'TrungNT', 'PM');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('PHP', 'HungTH', 'Member');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('PHP', 'HoanTV', 'Member');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('PHP', 'HaiNV', 'Member');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('JAVA', 'DungLV', 'Member');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('React', 'DatNT', 'Member');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('JAVA', 'HiepPD', 'Member');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('PHP', 'HaiN', 'Member');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('JAVA', 'HaoH', 'Member');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('JAVA', 'HoangL', 'Member');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('JAVA', 'TuanLQ', 'Member');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('React', 'QuangNM', 'Member');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('React', 'ThanhDT', 'Member');
INSERT INTO public.member_of_team_tb (team_id, member_id, "position") VALUES ('React', 'LuanND', 'Member');


--
-- TOC entry 2866 (class 0 OID 32427)
-- Dependencies: 199
-- Data for Name: screen_auth_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.screen_auth_tb (auth_group_id, screen_id, allowed_to_open) VALUES ('Admin', 'frmLogin', '1');
INSERT INTO public.screen_auth_tb (auth_group_id, screen_id, allowed_to_open) VALUES ('Admin', 'frmMenu', '1');
INSERT INTO public.screen_auth_tb (auth_group_id, screen_id, allowed_to_open) VALUES ('Admin', 'frmPersonalInfo', '1');
INSERT INTO public.screen_auth_tb (auth_group_id, screen_id, allowed_to_open) VALUES ('Admin', 'frmEmployeeList', '1');
INSERT INTO public.screen_auth_tb (auth_group_id, screen_id, allowed_to_open) VALUES ('Admin', 'frmPersonalTimesheets', '1');
INSERT INTO public.screen_auth_tb (auth_group_id, screen_id, allowed_to_open) VALUES ('Admin', 'frmTimesheets', '1');
INSERT INTO public.screen_auth_tb (auth_group_id, screen_id, allowed_to_open) VALUES ('Admin', 'tsmi_Logout', '1');
INSERT INTO public.screen_auth_tb (auth_group_id, screen_id, allowed_to_open) VALUES ('Admin', 'frmPersonalTimesheet', '1');


--
-- TOC entry 2867 (class 0 OID 32430)
-- Dependencies: 200
-- Data for Name: screen_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.screen_tb (screen_id, screen_name) VALUES ('frmLogin', 'Màn hình đăng nhập');
INSERT INTO public.screen_tb (screen_id, screen_name) VALUES ('frmMenu', 'Màn hình Menu');
INSERT INTO public.screen_tb (screen_id, screen_name) VALUES ('frmEmpoloyeeList', 'Màn hình danh sách nhân viên');


--
-- TOC entry 2868 (class 0 OID 32433)
-- Dependencies: 201
-- Data for Name: team_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.team_tb (team_id, department_id, team_name) VALUES ('JAVA', 'DEV', 'Java Development');
INSERT INTO public.team_tb (team_id, department_id, team_name) VALUES ('NET', 'DEV', 'NET Development');
INSERT INTO public.team_tb (team_id, department_id, team_name) VALUES ('PHP', 'DEV', 'DEV Development');
INSERT INTO public.team_tb (team_id, department_id, team_name) VALUES ('React', 'DEV', 'DEV Development');
INSERT INTO public.team_tb (team_id, department_id, team_name) VALUES ('Comtor', 'DEV', 'DEV Development');
INSERT INTO public.team_tb (team_id, department_id, team_name) VALUES ('Tester', 'DEV', 'DEV Development');
INSERT INTO public.team_tb (team_id, department_id, team_name) VALUES ('HR', 'General', 'Human Resource');
INSERT INTO public.team_tb (team_id, department_id, team_name) VALUES ('BOD', 'BOD', 'BOD');


--
-- TOC entry 2869 (class 0 OID 32436)
-- Dependencies: 202
-- Data for Name: timesheets_details_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2022-11-29', '2022-11-29 13:30:24', '2022-11-29 16:42:00', 3.2);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Long', '2022-11-28', '2022-11-28 07:59:20', '2022-11-28 13:30:05', 5.5);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2022-11-25', '2022-11-25 17:02:38', '2022-11-25 17:02:38', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2022-11-27', '2022-11-27 14:01:35', '2022-11-27 14:01:35', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2022-11-29', '2022-11-29 10:30:30', '2022-11-29 17:04:33', 6.6);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-28', '2022-11-28 11:31:26', '2022-11-28 13:24:45', 1.9);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2022-11-29', '2022-11-29 08:04:35', '2022-11-29 15:40:23', 7.6);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2022-11-29', '2022-11-29 09:04:35', '2022-11-29 16:03:59', 7.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2022-11-28', '2022-11-28 07:45:22', '2022-11-28 16:48:22', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Long', '2022-11-29', '2022-11-29 07:56:11', '2022-11-29 15:17:22', 7.4);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2022-11-30', '2022-11-30 11:23:23', '2022-11-30 14:58:46', 3.6);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Sỹ Thao', '2022-11-27', '2022-11-27 17:11:37', '2022-11-27 17:41:45', 0.5);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Sỹ Thao', '2022-11-30', '2022-11-30 08:26:23', '2022-11-30 13:01:27', 4.6);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2022-11-30', '2022-11-30 10:40:13', '2022-11-30 14:04:41', 3.4);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-30', '2022-11-30 10:25:12', '2022-11-30 14:46:19', 4.4);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Hoàng-intern', '2022-11-30', '2022-11-30 08:06:10', '2022-11-30 08:06:10', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2022-11-30', '2022-11-30 07:53:49', '2022-11-30 13:19:02', 5.4);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2022-11-29', '2022-11-29 07:50:34', '2022-11-29 14:39:08', 6.8);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Hoàng-intern', '2022-11-28', '2022-11-28 08:02:57', '2022-11-28 13:00:38', 5.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2022-11-25', '2022-11-25 16:55:51', '2022-11-25 16:55:51', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2022-11-21', '2022-11-21 16:25:49', '2022-11-21 16:26:03', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Sỹ Thao', '2022-11-21', '2022-11-21 07:58:20', '2022-11-21 10:51:01', 2.9);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2022-11-28', '2022-11-28 07:54:02', '2022-11-28 13:10:28', 5.3);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Sỹ Thao', '2022-11-24', '2022-11-24 09:37:39', '2022-11-24 09:37:39', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Sỹ Thao', '2022-11-26', '2022-11-26 17:46:29', '2022-11-26 17:46:46', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'CẢNH BÁO!', '2022-11-25', '2022-11-25 16:53:04', '2022-11-25 16:53:04', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-26', '2022-11-26 09:11:05', '2022-11-26 14:23:04', 5.2);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-29', '2022-11-29 11:41:09', '2022-11-29 17:16:28', 5.6);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2022-11-29', '2022-11-29 07:09:43', '2022-11-29 07:09:43', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2022-11-30', '2022-11-30 12:23:21', '2022-11-30 12:23:21', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Sỹ Thao', '2022-11-23', '2022-11-23 13:09:14', '2022-11-23 13:09:26', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2022-11-28', '2022-11-28 12:37:53', '2022-11-28 12:37:53', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-20', '2022-11-20 08:08:58', '2022-11-20 08:08:58', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2022-11-30', '2022-11-30 13:38:22', '2022-11-30 13:38:22', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2022-11-29', '2022-11-29 08:36:49', '2022-11-29 09:48:54', 1.2);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2022-11-25', '2022-11-25 08:12:20', '2022-11-25 15:28:19', 7.3);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2022-11-29', '2022-11-29 07:54:42', '2022-11-29 13:07:31', 5.2);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Sỹ Thao', '2022-11-25', '2022-11-25 11:52:02', '2022-11-25 11:52:02', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2022-11-30', '2022-11-30 07:49:58', '2022-11-30 14:40:42', 6.8);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2022-11-28', '2022-11-28 07:52:40', '2022-11-28 14:09:11', 6.3);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2022-11-28', '2022-11-28 11:46:40', '2022-11-28 13:40:13', 1.9);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-24', '2022-11-24 13:24:48', '2022-11-24 13:24:48', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2022-11-25', '2022-11-25 17:00:11', '2022-11-25 17:00:11', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Hoàng-intern', '2022-11-29', '2022-11-29 12:52:27', '2022-11-29 15:42:12', 2.8);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Huỳnh Quốc Trung', '2022-11-25', '2022-11-25 17:35:15', '2022-11-25 17:35:47', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2022-11-25', '2022-11-25 16:55:18', '2022-11-25 17:03:14', 0.1);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2022-11-28', '2022-11-28 08:03:06', '2022-11-28 16:02:29', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'CẢNH BÁO!', '2022-11-28', '2022-11-28 07:52:57', '2022-11-28 07:52:57', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Sỹ Thao', '2022-11-29', '2022-11-29 07:52:56', '2022-11-29 14:46:20', 6.9);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2022-11-28', '2022-11-28 07:48:51', '2022-11-28 14:56:11', 7.1);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2022-11-25', '2022-11-25 16:55:15', '2022-11-25 16:55:15', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2022-11-28', '2022-11-28 12:37:08', '2022-11-28 20:44:58', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2022-11-30', '2022-11-30 07:44:25', '2022-11-30 07:44:25', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47363565944846', '2022-11-30', '2022-11-30 15:24:38', '2022-11-30 15:24:38', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2022-11-29', '2022-11-29 07:58:55', '2022-11-29 13:06:57', 5.1);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Long', '2022-11-30', '2022-11-30 12:23:00', '2022-11-30 12:23:00', 0.0);


--
-- TOC entry 2870 (class 0 OID 32439)
-- Dependencies: 203
-- Data for Name: timesheets_raw_data_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2871 (class 0 OID 32442)
-- Dependencies: 204
-- Data for Name: timesheets_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('HaoH', 'Hoàng Hảo', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, 1.9, 7.0, 5.4, NULL, 3.0, 14.3);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('ThaoLS', 'Lê Sỹ Thao', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.9, NULL, 0.0, 0.0, 0.0, 0.0, 0.5, NULL, 6.9, 4.6, NULL, 4.0, 14.9);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('SangLT', 'Lê Thị Sang', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, 8.0, 6.6, 6.8, NULL, 3.0, 21.4);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('DungLV', 'Lê Văn Dũng', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8.0, 6.8, 0.0, NULL, 2.0, 14.8);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('TrungNT', 'Ngô Thành Trung', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, 7.3, NULL, 0.0, 6.3, 1.2, 0.0, NULL, 3.0, 14.8);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('LuanND', 'Nguyễn Đình Luân', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3.2, NULL, NULL, 1.0, 3.2);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('HaiNV', 'Nguyễn Văn Hải', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, 7.1, 5.2, 0.0, NULL, 2.0, 12.3);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('HiepPD', 'Phan Đình Hiệp', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, 8.0, 5.1, 3.4, NULL, 3.0, 16.5);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('HungTH', 'Trần Hữu Hùng', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.1, NULL, NULL, 0.0, 7.6, 3.6, NULL, 3.0, 11.3);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('VyTTH', 'Trần Thị Hiền Vy', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, 0.0, NULL, 5.2, NULL, 1.9, 5.6, 4.4, NULL, 4.0, 17.1);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('HoanTV', 'Trần Văn Hoàn', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5.3, 0.0, NULL, 3.0, 2.0, 8.3);


--
-- TOC entry 2872 (class 0 OID 32445)
-- Dependencies: 205
-- Data for Name: user_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('ThanhDD', 'c30f02adc000b565f761a2b292b37169', 'Đường Đức Thanh', B'1', '1997-04-29', 'thanhdd@golineglobal.vn', '0379113210', 'Ngũ Hành Sơn, Đà Nẵng', 'Kinh', 'Không', '184272075', NULL, NULL, NULL, '2023-03-01', NULL, 'Admin');
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('ThaoLS', '1962026656160185351301320480154111117132155', 'Lê Sỹ Thao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('ThienLTH', '1962026656160185351301320480154111117132155', 'Lê Trương Huỳnh Thiên', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('ChuongLV', '1962026656160185351301320480154111117132155', 'Lê Văn Chương', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('VyTTH', '1962026656160185351301320480154111117132155', 'Trần Thị Hiền Vy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('DatTC', '1962026656160185351301320480154111117132155', 'Thân Công Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('SangLT', '1962026656160185351301320480154111117132155', 'Lê Thị Sang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('TrungNT', '1962026656160185351301320480154111117132155', 'Ngô Thành Trung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('HungTH', '1962026656160185351301320480154111117132155', 'Trần Hữu Hùng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('HoanTV', '1962026656160185351301320480154111117132155', 'Trần Văn Hoàn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('HaiNV', '1962026656160185351301320480154111117132155', 'Nguyễn Văn Hải', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('DungLV', '1962026656160185351301320480154111117132155', 'Lê Văn Dũng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('DatNT', '1962026656160185351301320480154111117132155', 'Nguyễn Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('HiepPD', '1962026656160185351301320480154111117132155', 'Phan Đình Hiệp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('HaiN', '1962026656160185351301320480154111117132155', 'Nguyễn Hải', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('HaoH', '1962026656160185351301320480154111117132155', 'Hoàng Hảo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('HoangL', '1962026656160185351301320480154111117132155', 'Lê Hoàng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('TuanLQ', '1962026656160185351301320480154111117132155', 'Lê Quốc Tuấn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('QuangNM', '1962026656160185351301320480154111117132155', 'Nguyễn Minh Quang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('ThanhDT', '1962026656160185351301320480154111117132155', 'Đỗ Tấn Thành', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, photo, date_hired, contract_no, auth_group_id) VALUES ('LuanND', '1962026656160185351301320480154111117132155', 'Nguyễn Đình Luân', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 2729 (class 2606 OID 32452)
-- Name: screen_auth_tb auth_screen_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.screen_auth_tb
    ADD CONSTRAINT auth_screen_tb_pkey PRIMARY KEY (screen_id, auth_group_id);


--
-- TOC entry 2723 (class 2606 OID 32454)
-- Name: auth_group_tb authentication_group_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_tb
    ADD CONSTRAINT authentication_group_tb_pkey PRIMARY KEY (auth_group_id);


--
-- TOC entry 2725 (class 2606 OID 32456)
-- Name: department_tb department_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_tb
    ADD CONSTRAINT department_tb_pkey PRIMARY KEY (department_id);


--
-- TOC entry 2727 (class 2606 OID 32458)
-- Name: member_of_team_tb member_of_team_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_of_team_tb
    ADD CONSTRAINT member_of_team_tb_pkey PRIMARY KEY (team_id, member_id);


--
-- TOC entry 2731 (class 2606 OID 32460)
-- Name: screen_tb screen_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.screen_tb
    ADD CONSTRAINT screen_tb_pkey PRIMARY KEY (screen_id);


--
-- TOC entry 2733 (class 2606 OID 32462)
-- Name: team_tb team_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_tb
    ADD CONSTRAINT team_id_pkey PRIMARY KEY (team_id);


--
-- TOC entry 2735 (class 2606 OID 32464)
-- Name: timesheets_details_tb timesheets_details_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timesheets_details_tb
    ADD CONSTRAINT timesheets_details_tb_pkey PRIMARY KEY (fullname, date);


--
-- TOC entry 2737 (class 2606 OID 32466)
-- Name: timesheets_tb timesheets_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timesheets_tb
    ADD CONSTRAINT timesheets_tb_pkey PRIMARY KEY (username, year, month);


--
-- TOC entry 2739 (class 2606 OID 32468)
-- Name: user_tb user_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tb
    ADD CONSTRAINT user_tb_pkey PRIMARY KEY (username);


--
-- TOC entry 2740 (class 2620 OID 32551)
-- Name: timesheets_details_tb update_time_when_duplicate_fullname_and_date; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_time_when_duplicate_fullname_and_date BEFORE INSERT ON public.timesheets_details_tb FOR EACH ROW EXECUTE PROCEDURE public.update_time_when_duplicate_fullname_and_date();


--
-- TOC entry 2741 (class 2620 OID 32470)
-- Name: timesheets_tb update_total_working_hours_and_days_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_total_working_hours_and_days_trigger BEFORE INSERT OR UPDATE ON public.timesheets_tb FOR EACH ROW EXECUTE PROCEDURE public.update_total_working_hours_and_days();


-- Completed on 2023-04-17 16:59:21

--
-- PostgreSQL database dump complete
--

