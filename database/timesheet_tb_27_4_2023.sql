--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-04-27 11:38:09

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
-- TOC entry 225 (class 1255 OID 16399)
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
-- TOC entry 226 (class 1255 OID 16400)
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

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 16401)
-- Name: auth_group_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_tb (
    auth_group_id character varying(20) NOT NULL,
    auth_group_name character varying(50)
);


ALTER TABLE public.auth_group_tb OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16404)
-- Name: department_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department_tb (
    department_id character varying(20) NOT NULL,
    department_name character varying(50),
    descriptons character varying(100)
);


ALTER TABLE public.department_tb OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16407)
-- Name: member_of_team_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member_of_team_tb (
    team_id character varying(20) NOT NULL,
    member_id character varying(50) NOT NULL,
    "position" character varying(20)
);


ALTER TABLE public.member_of_team_tb OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 41041)
-- Name: position_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.position_tb (
    position_name character varying(50),
    position_id character varying(20) NOT NULL
);


ALTER TABLE public.position_tb OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16410)
-- Name: screen_auth_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.screen_auth_tb (
    auth_group_id character varying(20) NOT NULL,
    screen_id character varying(30) NOT NULL,
    allowed_to_open character varying(1)
);


ALTER TABLE public.screen_auth_tb OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16413)
-- Name: screen_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.screen_tb (
    screen_id character varying(30) NOT NULL,
    screen_name character varying(100)
);


ALTER TABLE public.screen_tb OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16416)
-- Name: team_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_tb (
    team_id character varying(20) NOT NULL,
    team_name character varying(50),
    department_id character varying(20)
);


ALTER TABLE public.team_tb OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16419)
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
-- TOC entry 221 (class 1259 OID 16422)
-- Name: timesheets_raw_data_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timesheets_raw_data_tb (
    fullname character varying(100),
    in_out_time timestamp without time zone
);


ALTER TABLE public.timesheets_raw_data_tb OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16425)
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
-- TOC entry 223 (class 1259 OID 16428)
-- Name: user_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_tb (
    username character varying(50) NOT NULL,
    password character varying(50),
    fullname character varying(50),
    birth_date date,
    email character varying(40),
    phone character varying(20),
    address character varying(150),
    ethnic character varying(10),
    religion character varying(10),
    citizen_id character varying(10),
    tax_code character varying(10),
    social_insurance_no character varying(10),
    date_hired date,
    contract_no character varying(10),
    auth_group_id character varying(20),
    photo bytea,
    gender boolean,
    team_id character varying(20),
    position_id character varying(20)
);


ALTER TABLE public.user_tb OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 16401)
-- Dependencies: 214
-- Data for Name: auth_group_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_group_tb (auth_group_id, auth_group_name) VALUES ('Admin', 'Administrator');
INSERT INTO public.auth_group_tb (auth_group_id, auth_group_name) VALUES ('User', 'User');


--
-- TOC entry 3385 (class 0 OID 16404)
-- Dependencies: 215
-- Data for Name: department_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.department_tb (department_id, department_name, descriptons) VALUES ('MKT', 'Marketing', 'Phòng marketing');
INSERT INTO public.department_tb (department_id, department_name, descriptons) VALUES ('BOD', 'Director', 'Phòng giám đốc');
INSERT INTO public.department_tb (department_id, department_name, descriptons) VALUES ('DEV', 'Development', 'Phòng phát triển');
INSERT INTO public.department_tb (department_id, department_name, descriptons) VALUES ('PRODUCT', 'Production', 'Phòng sản xuất');
INSERT INTO public.department_tb (department_id, department_name, descriptons) VALUES ('ACCOUNT', 'Accounting', 'Phòng kế toán');
INSERT INTO public.department_tb (department_id, department_name, descriptons) VALUES ('HR', 'Human Resource', 'Phòng nhân sự');
INSERT INTO public.department_tb (department_id, department_name, descriptons) VALUES ('None', 'Chưa có phòng', 'Chưa có phòng');


--
-- TOC entry 3386 (class 0 OID 16407)
-- Dependencies: 216
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
-- TOC entry 3394 (class 0 OID 41041)
-- Dependencies: 224
-- Data for Name: position_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.position_tb (position_name, position_id) VALUES ('Leader', 'PM');
INSERT INTO public.position_tb (position_name, position_id) VALUES ('Member
', 'Mem');


--
-- TOC entry 3387 (class 0 OID 16410)
-- Dependencies: 217
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
-- TOC entry 3388 (class 0 OID 16413)
-- Dependencies: 218
-- Data for Name: screen_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.screen_tb (screen_id, screen_name) VALUES ('frmLogin', 'Màn hình đăng nhập');
INSERT INTO public.screen_tb (screen_id, screen_name) VALUES ('frmMenu', 'Màn hình Menu');
INSERT INTO public.screen_tb (screen_id, screen_name) VALUES ('frmEmpoloyeeList', 'Màn hình danh sách nhân viên');


--
-- TOC entry 3389 (class 0 OID 16416)
-- Dependencies: 219
-- Data for Name: team_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.team_tb (team_id, team_name, department_id) VALUES ('Comtor', 'DEV Development', 'DEV');
INSERT INTO public.team_tb (team_id, team_name, department_id) VALUES ('HR', 'Human Resource', 'HR');
INSERT INTO public.team_tb (team_id, team_name, department_id) VALUES ('JAVA', 'Java Development', 'DEV');
INSERT INTO public.team_tb (team_id, team_name, department_id) VALUES ('NET', 'NET Development', 'DEV');
INSERT INTO public.team_tb (team_id, team_name, department_id) VALUES ('BOD', 'Director team', 'BOD');
INSERT INTO public.team_tb (team_id, team_name, department_id) VALUES ('PHP', 'PHP Development', 'DEV');
INSERT INTO public.team_tb (team_id, team_name, department_id) VALUES ('React', 'REACT Development', 'DEV');
INSERT INTO public.team_tb (team_id, team_name, department_id) VALUES ('Tester', 'TESTER Development', 'DEV');
INSERT INTO public.team_tb (team_id, team_name, department_id) VALUES ('None', 'None', 'None');
INSERT INTO public.team_tb (team_id, team_name, department_id) VALUES ('BODNone', 'None', 'BOD');
INSERT INTO public.team_tb (team_id, team_name, department_id) VALUES ('DEVNone', 'None', 'DEV');
INSERT INTO public.team_tb (team_id, team_name, department_id) VALUES ('HRNone', 'None', 'HR');
INSERT INTO public.team_tb (team_id, team_name, department_id) VALUES ('MKTNone', 'None', 'MKT');
INSERT INTO public.team_tb (team_id, team_name, department_id) VALUES ('ACCOUNTNone', 'None', 'ACCOUNT');
INSERT INTO public.team_tb (team_id, team_name, department_id) VALUES ('PRODUCTNone', 'None', 'PRODUCT');


--
-- TOC entry 3390 (class 0 OID 16419)
-- Dependencies: 220
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
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-14', '2023-03-14 08:05:46', '2023-03-14 08:05:46', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-06', '2023-03-06 07:26:50', '2023-03-06 07:26:50', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-21', '2023-03-21 08:10:36', '2023-03-21 08:10:36', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-07', '2023-03-07 07:57:48', '2023-03-07 17:03:24', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phạm Văn Quân', '2023-03-16', '2023-03-16 08:04:53', '2023-03-16 12:02:12', 4.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-13', '2023-03-13 07:53:43', '2023-03-13 17:11:13', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-21', '2023-03-21 07:52:43', '2023-03-21 17:28:20', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-10', '2023-03-10 17:12:48', '2023-03-10 17:12:48', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-20', '2023-03-20 09:30:47', '2023-03-20 18:56:39', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-20', '2023-03-20 07:52:10', '2023-03-20 17:03:37', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-09', '2023-03-09 08:14:20', '2023-03-09 17:08:16', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-31', '2023-03-31 08:02:43', '2023-03-31 17:00:34', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-21', '2023-03-21 07:58:12', '2023-03-21 17:02:17', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-07', '2023-03-07 07:59:56', '2023-03-07 17:16:48', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-02', '2023-03-02 08:00:14', '2023-03-02 08:00:14', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-10', '2023-03-10 07:52:31', '2023-03-10 14:32:46', 6.7);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-10', '2023-03-10 08:01:23', '2023-03-10 17:07:54', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-28', '2023-03-28 07:53:04', '2023-03-28 17:18:13', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-09', '2023-03-09 08:00:40', '2023-03-09 17:06:59', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-31', '2023-03-31 07:59:42', '2023-03-31 17:08:12', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-30', '2023-03-30 08:10:12', '2023-03-30 17:46:28', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-27', '2023-03-27 08:09:25', '2023-03-27 17:11:47', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-31', '2023-03-31 07:49:20', '2023-03-31 17:08:21', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-17', '2023-03-17 08:08:34', '2023-03-17 17:02:46', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-09', '2023-03-09 08:28:02', '2023-03-09 17:18:51', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-22', '2023-03-22 07:57:22', '2023-03-22 17:24:29', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-09', '2023-03-09 07:44:08', '2023-03-09 17:08:33', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-03', '2023-03-03 09:52:23', '2023-03-03 17:37:01', 7.7);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-06', '2023-03-06 07:49:11', '2023-03-06 17:17:27', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-17', '2023-03-17 07:57:14', '2023-03-17 16:59:10', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-24', '2023-03-24 07:51:16', '2023-03-24 17:07:16', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-01', '2023-03-01 09:11:29', '2023-03-01 17:23:01', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-21', '2023-03-21 07:59:19', '2023-03-21 19:02:53', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'CẢNH BÁO!', '2023-03-02', '2023-03-02 17:11:23', '2023-03-02 17:11:23', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-28', '2023-03-28 07:53:02', '2023-03-28 17:11:51', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-16', '2023-03-16 07:24:49', '2023-03-16 17:10:42', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-13', '2023-03-13 07:58:24', '2023-03-13 17:03:28', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-28', '2023-03-28 07:43:51', '2023-03-28 17:06:37', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-02', '2023-03-02 07:58:04', '2023-03-02 17:11:02', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-15', '2023-03-15 07:26:45', '2023-03-15 17:07:59', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-20', '2023-03-20 07:53:46', '2023-03-20 07:53:46', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-31', '2023-03-31 08:13:45', '2023-03-31 17:03:40', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-17', '2023-03-17 07:54:59', '2023-03-17 17:02:29', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-16', '2023-03-16 07:40:32', '2023-03-16 17:07:01', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-17', '2023-03-17 07:37:03', '2023-03-17 17:01:34', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-28', '2023-03-28 17:15:12', '2023-03-28 17:15:12', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-22', '2023-03-22 07:47:01', '2023-03-22 17:06:00', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-23', '2023-03-23 08:09:35', '2023-03-23 17:34:46', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-15', '2023-03-15 08:01:58', '2023-03-15 17:07:14', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-15', '2023-03-15 08:03:50', '2023-03-15 08:03:50', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2023-03-09', '2023-03-09 07:48:35', '2023-03-09 12:02:53', 4.2);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-20', '2023-03-20 07:52:05', '2023-03-20 17:07:13', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-13', '2023-03-13 08:00:37', '2023-03-13 17:16:19', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-16', '2023-03-16 08:03:54', '2023-03-16 17:10:52', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-16', '2023-03-16 08:17:03', '2023-03-16 17:33:42', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-21', '2023-03-21 08:18:37', '2023-03-21 17:40:24', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-21', '2023-03-21 07:26:10', '2023-03-21 17:33:04', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-06', '2023-03-06 08:14:12', '2023-03-06 17:38:49', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-01', '2023-03-01 08:00:39', '2023-03-01 16:07:17', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-24', '2023-03-24 07:36:37', '2023-03-24 07:36:37', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-24', '2023-03-24 07:59:17', '2023-03-24 07:59:17', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-08', '2023-03-08 07:36:07', '2023-03-08 17:16:33', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-10', '2023-03-10 07:50:23', '2023-03-10 17:08:44', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-07', '2023-03-07 07:55:16', '2023-03-07 17:04:55', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-16', '2023-03-16 07:59:26', '2023-03-16 17:07:06', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-31', '2023-03-31 07:32:24', '2023-03-31 17:18:13', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-20', '2023-03-20 07:55:35', '2023-03-20 17:06:42', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-16', '2023-03-16 08:14:18', '2023-03-16 19:19:08', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-15', '2023-03-15 08:03:47', '2023-03-15 18:25:46', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-03', '2023-03-03 07:39:38', '2023-03-03 17:39:52', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-03', '2023-03-03 08:14:10', '2023-03-03 08:14:10', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47911887175708', '2023-03-13', '2023-03-13 12:53:52', '2023-03-13 12:53:52', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-14', '2023-03-14 09:27:39', '2023-03-14 17:33:49', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-17', '2023-03-17 07:47:47', '2023-03-17 17:33:21', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2023-03-20', '2023-03-20 07:53:53', '2023-03-20 17:09:07', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-29', '2023-03-29 08:02:55', '2023-03-29 17:11:46', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-16', '2023-03-16 07:59:19', '2023-03-16 17:05:11', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-03', '2023-03-03 17:39:45', '2023-03-03 17:39:45', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-21', '2023-03-21 08:00:34', '2023-03-21 17:13:41', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-29', '2023-03-29 07:47:19', '2023-03-29 13:10:36', 5.4);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-24', '2023-03-24 08:00:36', '2023-03-24 17:39:16', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-03', '2023-03-03 07:48:25', '2023-03-03 17:33:23', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-02', '2023-03-02 08:10:49', '2023-03-02 17:10:37', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-28', '2023-03-28 07:45:15', '2023-03-28 17:06:50', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-09', '2023-03-09 08:12:45', '2023-03-09 17:08:27', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-09', '2023-03-09 07:57:08', '2023-03-09 17:05:30', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-17', '2023-03-17 07:58:00', '2023-03-17 17:33:50', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47911887175708', '2023-03-14', '2023-03-14 14:43:37', '2023-03-14 14:43:37', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Sỹ Thao', '2023-03-13', '2023-03-13 12:45:15', '2023-03-13 12:45:15', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-27', '2023-03-27 07:57:48', '2023-03-27 17:32:38', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-23', '2023-03-23 08:09:31', '2023-03-23 17:15:45', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-30', '2023-03-30 08:04:21', '2023-03-30 08:04:21', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-03', '2023-03-03 07:46:22', '2023-03-03 17:34:17', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-09', '2023-03-09 07:57:02', '2023-03-09 17:02:12', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-15', '2023-03-15 08:18:26', '2023-03-15 18:25:42', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-22', '2023-03-22 08:17:16', '2023-03-22 17:41:07', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-23', '2023-03-23 08:00:03', '2023-03-23 08:00:03', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-07', '2023-03-07 12:42:58', '2023-03-07 12:42:58', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-02', '2023-03-02 07:44:00', '2023-03-02 17:10:32', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-02', '2023-03-02 07:47:07', '2023-03-02 17:10:34', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-27', '2023-03-27 07:32:25', '2023-03-27 17:05:07', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2023-03-01', '2023-03-01 07:55:01', '2023-03-01 07:55:01', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-03', '2023-03-03 14:38:07', '2023-03-03 14:38:07', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-03', '2023-03-03 08:02:38', '2023-03-03 15:12:57', 7.2);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-17', '2023-03-17 07:57:09', '2023-03-17 17:02:49', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-06', '2023-03-06 08:00:32', '2023-03-06 17:18:54', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-02', '2023-03-02 07:38:32', '2023-03-02 17:10:22', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'CẢNH BÁO!', '2023-03-08', '2023-03-08 15:55:28', '2023-03-08 15:55:28', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-22', '2023-03-22 07:59:07', '2023-03-22 17:08:50', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-06', '2023-03-06 07:53:28', '2023-03-06 17:07:23', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-06', '2023-03-06 08:18:37', '2023-03-06 19:18:27', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-01', '2023-03-01 07:55:05', '2023-03-01 17:14:52', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-22', '2023-03-22 07:54:08', '2023-03-22 17:40:59', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-17', '2023-03-17 07:28:20', '2023-03-17 17:04:08', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-14', '2023-03-14 07:51:55', '2023-03-14 07:51:55', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-29', '2023-03-29 07:41:27', '2023-03-29 17:38:44', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-08', '2023-03-08 17:12:45', '2023-03-08 17:12:45', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phạm Văn Quân', '2023-03-21', '2023-03-21 08:09:10', '2023-03-21 08:09:10', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-03', '2023-03-03 08:04:39', '2023-03-03 17:34:20', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2023-03-08', '2023-03-08 07:52:46', '2023-03-08 17:14:58', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-28', '2023-03-28 17:14:13', '2023-03-28 17:14:13', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-22', '2023-03-22 07:54:05', '2023-03-22 17:08:43', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-27', '2023-03-27 08:01:38', '2023-03-27 17:08:41', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-15', '2023-03-15 07:56:18', '2023-03-15 17:05:30', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-14', '2023-03-14 07:29:52', '2023-03-14 17:22:19', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-08', '2023-03-08 07:48:56', '2023-03-08 17:02:40', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-16', '2023-03-16 07:44:39', '2023-03-16 17:05:16', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-27', '2023-03-27 11:08:39', '2023-03-27 11:08:39', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Sỹ Thao', '2023-03-27', '2023-03-27 07:54:21', '2023-03-27 07:54:21', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-23', '2023-03-23 17:10:22', '2023-03-23 17:10:22', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-09', '2023-03-09 07:55:46', '2023-03-09 07:55:46', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phạm Văn Quân', '2023-03-08', '2023-03-08 17:13:03', '2023-03-08 17:13:03', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-30', '2023-03-30 08:03:23', '2023-03-30 17:12:29', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-03', '2023-03-03 08:04:35', '2023-03-03 17:34:14', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-09', '2023-03-09 08:01:34', '2023-03-09 17:07:17', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-01', '2023-03-01 07:39:08', '2023-03-01 17:13:22', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-01', '2023-03-01 09:12:22', '2023-03-01 17:22:58', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-24', '2023-03-24 08:01:33', '2023-03-24 08:01:33', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2023-03-15', '2023-03-15 07:54:04', '2023-03-15 17:07:10', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Hoàng-intern', '2023-03-14', '2023-03-14 07:56:58', '2023-03-14 07:56:58', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-23', '2023-03-23 07:43:34', '2023-03-23 17:06:14', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-31', '2023-03-31 07:42:16', '2023-03-31 07:42:16', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-10', '2023-03-10 07:55:54', '2023-03-10 19:04:31', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2023-03-02', '2023-03-02 07:45:29', '2023-03-02 17:12:23', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phạm Văn Quân', '2023-03-10', '2023-03-10 08:05:06', '2023-03-10 08:05:06', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-22', '2023-03-22 07:27:46', '2023-03-22 17:08:32', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-20', '2023-03-20 07:10:40', '2023-03-20 17:07:04', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-20', '2023-03-20 08:09:31', '2023-03-20 18:14:26', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-02', '2023-03-02 08:34:38', '2023-03-02 08:34:38', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-21', '2023-03-21 07:49:44', '2023-03-21 07:49:44', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-13', '2023-03-13 07:48:26', '2023-03-13 17:03:32', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phạm Văn Quân', '2023-03-14', '2023-03-14 08:00:27', '2023-03-14 08:00:27', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-09', '2023-03-09 07:59:24', '2023-03-09 17:18:25', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-21', '2023-03-21 07:54:31', '2023-03-21 17:09:38', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-03', '2023-03-03 07:53:52', '2023-03-03 17:39:42', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-27', '2023-03-27 08:09:34', '2023-03-27 08:09:34', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-09', '2023-03-09 08:16:10', '2023-03-09 17:12:18', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-14', '2023-03-14 07:59:49', '2023-03-14 17:24:16', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Hoàng-intern', '2023-03-09', '2023-03-09 08:15:52', '2023-03-09 08:15:52', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-14', '2023-03-14 08:13:51', '2023-03-14 17:32:17', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-31', '2023-03-31 08:02:11', '2023-03-31 08:02:11', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-28', '2023-03-28 08:04:28', '2023-03-28 08:04:28', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-02', '2023-03-02 11:35:01', '2023-03-02 11:35:01', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2023-03-14', '2023-03-14 07:55:46', '2023-03-14 17:06:09', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-06', '2023-03-06 07:42:42', '2023-03-06 17:38:37', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-23', '2023-03-23 07:52:18', '2023-03-23 17:43:40', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-06', '2023-03-06 08:04:14', '2023-03-06 17:17:23', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-07', '2023-03-07 08:19:48', '2023-03-07 18:47:53', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-16', '2023-03-16 07:57:16', '2023-03-16 17:49:24', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-14', '2023-03-14 07:57:35', '2023-03-14 17:10:38', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-03', '2023-03-03 07:49:42', '2023-03-03 17:43:48', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-15', '2023-03-15 07:45:35', '2023-03-15 17:27:59', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-08', '2023-03-08 08:04:52', '2023-03-08 17:19:10', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-22', '2023-03-22 07:31:28', '2023-03-22 17:40:47', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-10', '2023-03-10 07:47:15', '2023-03-10 17:08:48', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-30', '2023-03-30 07:47:50', '2023-03-30 17:48:04', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-23', '2023-03-23 07:25:40', '2023-03-23 17:44:11', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Hoàng-intern', '2023-03-07', '2023-03-07 08:03:13', '2023-03-07 08:03:13', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-29', '2023-03-29 08:26:56', '2023-03-29 17:38:11', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-13', '2023-03-13 10:18:47', '2023-03-13 17:11:18', 6.9);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-13', '2023-03-13 08:08:32', '2023-03-13 17:36:10', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-21', '2023-03-21 08:00:29', '2023-03-21 17:16:53', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-27', '2023-03-27 08:05:45', '2023-03-27 19:02:26', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-15', '2023-03-15 07:44:14', '2023-03-15 17:03:07', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'CẢNH BÁO!', '2023-03-30', '2023-03-30 17:11:42', '2023-03-30 17:11:42', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-29', '2023-03-29 08:00:16', '2023-03-29 17:39:33', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-13', '2023-03-13 07:56:17', '2023-03-13 17:36:18', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-20', '2023-03-20 08:00:58', '2023-03-20 17:25:18', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-15', '2023-03-15 08:14:04', '2023-03-15 17:07:41', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-07', '2023-03-07 15:59:56', '2023-03-07 17:07:10', 1.1);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-16', '2023-03-16 08:01:40', '2023-03-16 17:07:08', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-16', '2023-03-16 07:59:22', '2023-03-16 17:10:45', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-27', '2023-03-27 08:21:53', '2023-03-27 17:36:00', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-23', '2023-03-23 07:41:12', '2023-03-23 07:41:12', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-21', '2023-03-21 07:57:58', '2023-03-21 17:04:18', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-08', '2023-03-08 07:59:32', '2023-03-08 17:05:47', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-08', '2023-03-08 15:10:17', '2023-03-08 15:10:17', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-30', '2023-03-30 08:19:33', '2023-03-30 17:34:00', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-10', '2023-03-10 07:53:50', '2023-03-10 17:03:20', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-09', '2023-03-09 07:55:44', '2023-03-09 17:08:44', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Sỹ Thao', '2023-03-07', '2023-03-07 07:51:21', '2023-03-07 07:51:21', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-07', '2023-03-07 17:12:12', '2023-03-07 17:12:12', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-27', '2023-03-27 08:07:37', '2023-03-27 17:32:35', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-27', '2023-03-27 08:15:24', '2023-03-27 08:15:24', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-22', '2023-03-22 07:42:06', '2023-03-22 17:41:09', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-13', '2023-03-13 08:00:54', '2023-03-13 08:00:54', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-24', '2023-03-24 08:34:01', '2023-03-24 17:40:25', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2023-03-22', '2023-03-22 07:48:32', '2023-03-22 17:07:46', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Hoàng-intern', '2023-03-20', '2023-03-20 08:00:44', '2023-03-20 08:00:44', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Hoàng-intern', '2023-03-21', '2023-03-21 07:56:47', '2023-03-21 07:56:47', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-30', '2023-03-30 07:27:45', '2023-03-30 17:10:17', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-29', '2023-03-29 08:11:08', '2023-03-29 17:07:24', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-29', '2023-03-29 07:35:41', '2023-03-29 17:07:22', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-13', '2023-03-13 08:46:32', '2023-03-13 17:29:18', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-24', '2023-03-24 07:49:51', '2023-03-24 07:49:51', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-01', '2023-03-01 17:22:35', '2023-03-01 17:22:35', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-08', '2023-03-08 07:37:28', '2023-03-08 15:52:40', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-23', '2023-03-23 07:36:43', '2023-03-23 16:04:36', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Hoàng-intern', '2023-03-16', '2023-03-16 07:55:31', '2023-03-16 17:03:09', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-14', '2023-03-14 07:38:47', '2023-03-14 07:38:47', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phạm Văn Quân', '2023-03-07', '2023-03-07 08:00:43', '2023-03-07 11:53:20', 3.9);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2023-03-16', '2023-03-16 07:47:27', '2023-03-16 17:05:19', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-17', '2023-03-17 08:01:14', '2023-03-17 17:03:50', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-27', '2023-03-27 07:59:33', '2023-03-27 17:02:27', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-08', '2023-03-08 08:23:40', '2023-03-08 08:23:40', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-29', '2023-03-29 08:14:29', '2023-03-29 17:28:55', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-13', '2023-03-13 10:41:54', '2023-03-13 10:41:54', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-03', '2023-03-03 08:00:23', '2023-03-03 17:33:27', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-02', '2023-03-02 07:58:08', '2023-03-02 16:14:07', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-08', '2023-03-08 18:01:02', '2023-03-08 18:01:02', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-23', '2023-03-23 07:59:42', '2023-03-23 17:14:15', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Hoàng-intern', '2023-03-15', '2023-03-15 07:55:52', '2023-03-15 07:55:52', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-07', '2023-03-07 07:48:58', '2023-03-07 17:18:05', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2023-03-21', '2023-03-21 07:54:28', '2023-03-21 17:16:44', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-14', '2023-03-14 08:12:08', '2023-03-14 08:12:08', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-24', '2023-03-24 08:08:34', '2023-03-24 18:12:02', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-24', '2023-03-24 08:03:43', '2023-03-24 17:08:27', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-14', '2023-03-14 08:08:36', '2023-03-14 17:10:33', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-27', '2023-03-27 08:04:06', '2023-03-27 17:11:42', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-15', '2023-03-15 08:03:44', '2023-03-15 08:03:44', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-10', '2023-03-10 07:59:20', '2023-03-10 07:59:20', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-30', '2023-03-30 07:56:22', '2023-03-30 17:34:20', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-02', '2023-03-02 07:53:58', '2023-03-02 17:11:10', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-30', '2023-03-30 07:40:29', '2023-03-30 17:22:16', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-06', '2023-03-06 07:53:31', '2023-03-06 17:17:21', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-02', '2023-03-02 08:19:49', '2023-03-02 08:19:49', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-24', '2023-03-24 08:06:25', '2023-03-24 08:06:25', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-17', '2023-03-17 08:10:21', '2023-03-17 17:34:42', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-08', '2023-03-08 07:44:36', '2023-03-08 17:17:38', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-15', '2023-03-15 07:50:53', '2023-03-15 15:55:42', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-14', '2023-03-14 07:49:53', '2023-03-14 17:12:01', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-23', '2023-03-23 07:53:24', '2023-03-23 17:19:07', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-31', '2023-03-31 07:57:22', '2023-03-31 17:03:52', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2023-03-13', '2023-03-13 07:54:21', '2023-03-13 17:38:40', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-07', '2023-03-07 07:51:26', '2023-03-07 17:37:02', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-17', '2023-03-17 07:51:04', '2023-03-17 17:03:39', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-13', '2023-03-13 07:51:30', '2023-03-13 17:29:21', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-02', '2023-03-02 07:55:55', '2023-03-02 17:06:17', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-20', '2023-03-20 07:49:06', '2023-03-20 17:07:00', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-07', '2023-03-07 08:00:00', '2023-03-07 17:18:54', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-13', '2023-03-13 08:36:49', '2023-03-13 17:59:56', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-23', '2023-03-23 07:55:09', '2023-03-23 17:01:07', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-08', '2023-03-08 07:52:48', '2023-03-08 07:52:48', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-24', '2023-03-24 08:06:27', '2023-03-24 17:01:32', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-30', '2023-03-30 07:59:06', '2023-03-30 13:54:58', 5.9);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2023-03-24', '2023-03-24 07:54:56', '2023-03-24 17:04:01', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2023-03-23', '2023-03-23 07:56:59', '2023-03-23 17:10:25', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-23', '2023-03-23 08:12:27', '2023-03-23 19:11:51', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-09', '2023-03-09 07:53:57', '2023-03-09 17:08:10', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-02', '2023-03-02 07:45:22', '2023-03-02 17:10:49', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-23', '2023-03-23 08:12:12', '2023-03-23 18:02:08', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-28', '2023-03-28 17:06:32', '2023-03-28 17:06:32', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-31', '2023-03-31 07:59:55', '2023-03-31 17:08:16', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-21', '2023-03-21 08:10:42', '2023-03-21 17:51:01', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-27', '2023-03-27 07:47:41', '2023-03-27 07:47:41', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-23', '2023-03-23 08:27:47', '2023-03-23 18:01:52', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-02', '2023-03-02 15:37:44', '2023-03-02 17:10:52', 1.6);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-16', '2023-03-16 07:59:35', '2023-03-16 17:11:18', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2023-03-03', '2023-03-03 07:52:28', '2023-03-03 17:39:35', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Hoàng-intern', '2023-03-22', '2023-03-22 08:02:55', '2023-03-22 08:02:55', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-01', '2023-03-01 08:09:23', '2023-03-01 17:25:13', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-14', '2023-03-14 07:21:37', '2023-03-14 17:25:12', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2023-03-17', '2023-03-17 07:57:20', '2023-03-17 17:03:10', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-07', '2023-03-07 07:53:05', '2023-03-07 17:17:29', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-06', '2023-03-06 08:00:54', '2023-03-06 08:00:54', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-20', '2023-03-20 07:19:33', '2023-03-20 17:06:38', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-17', '2023-03-17 08:01:02', '2023-03-17 17:04:29', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47911887175708', '2023-03-08', '2023-03-08 14:27:02', '2023-03-08 14:27:02', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-07', '2023-03-07 07:49:30', '2023-03-07 17:23:06', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-27', '2023-03-27 08:15:19', '2023-03-27 08:15:19', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-28', '2023-03-28 07:51:29', '2023-03-28 17:07:48', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-22', '2023-03-22 07:57:19', '2023-03-22 15:54:52', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-13', '2023-03-13 08:36:40', '2023-03-13 17:58:47', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-16', '2023-03-16 07:59:30', '2023-03-16 17:15:49', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-30', '2023-03-30 07:51:29', '2023-03-30 17:19:38', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-27', '2023-03-27 07:57:51', '2023-03-27 17:11:37', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-10', '2023-03-10 07:55:29', '2023-03-10 17:08:54', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-22', '2023-03-22 07:55:46', '2023-03-22 17:08:53', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-01', '2023-03-01 07:46:08', '2023-03-01 17:23:06', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phạm Văn Quân', '2023-03-17', '2023-03-17 08:07:42', '2023-03-17 08:07:42', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-14', '2023-03-14 08:01:45', '2023-03-14 17:00:59', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-29', '2023-03-29 07:58:04', '2023-03-29 17:39:36', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Sỹ Thao', '2023-03-08', '2023-03-08 15:13:10', '2023-03-08 15:19:15', 0.1);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-16', '2023-03-16 07:57:20', '2023-03-16 17:02:58', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-30', '2023-03-30 07:59:12', '2023-03-30 17:17:21', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phạm Văn Quân', '2023-03-09', '2023-03-09 08:05:04', '2023-03-09 17:05:40', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-03', '2023-03-03 07:49:32', '2023-03-03 17:34:01', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-28', '2023-03-28 07:46:40', '2023-03-28 17:07:39', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Hoàng-intern', '2023-03-06', '2023-03-06 08:05:31', '2023-03-06 08:05:31', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-07', '2023-03-07 07:47:37', '2023-03-07 17:12:20', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-08', '2023-03-08 07:38:54', '2023-03-08 17:04:28', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-07', '2023-03-07 08:02:04', '2023-03-07 17:22:31', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Hoàng-intern', '2023-03-13', '2023-03-13 07:56:40', '2023-03-13 07:56:40', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-01', '2023-03-01 08:05:07', '2023-03-01 17:13:27', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-01', '2023-03-01 08:09:25', '2023-03-01 08:09:25', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-14', '2023-03-14 07:51:15', '2023-03-14 17:14:04', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-16', '2023-03-16 17:33:31', '2023-03-16 17:33:31', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-10', '2023-03-10 08:06:18', '2023-03-10 08:06:18', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-28', '2023-03-28 08:34:10', '2023-03-28 08:34:10', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-22', '2023-03-22 08:31:45', '2023-03-22 18:40:23', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-24', '2023-03-24 08:01:40', '2023-03-24 17:18:28', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-14', '2023-03-14 07:43:38', '2023-03-14 17:32:12', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-09', '2023-03-09 08:14:49', '2023-03-09 17:18:55', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-09', '2023-03-09 08:01:31', '2023-03-09 17:02:45', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-29', '2023-03-29 07:58:07', '2023-03-29 17:22:48', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-30', '2023-03-30 07:56:27', '2023-03-30 17:17:24', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-30', '2023-03-30 07:59:14', '2023-03-30 16:54:14', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-13', '2023-03-13 07:37:39', '2023-03-13 17:58:21', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-09', '2023-03-09 07:27:08', '2023-03-09 17:05:22', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-29', '2023-03-29 07:58:18', '2023-03-29 17:39:22', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-16', '2023-03-16 07:47:36', '2023-03-16 17:11:08', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-29', '2023-03-29 08:05:09', '2023-03-29 17:39:29', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-23', '2023-03-23 07:49:28', '2023-03-23 17:03:29', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-15', '2023-03-15 07:59:43', '2023-03-15 17:07:47', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-24', '2023-03-24 07:51:21', '2023-03-24 07:51:21', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Chương', '2023-03-10', '2023-03-10 09:48:16', '2023-03-10 18:09:18', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-10', '2023-03-10 07:59:22', '2023-03-10 17:12:43', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2023-03-07', '2023-03-07 07:57:43', '2023-03-07 17:18:01', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-24', '2023-03-24 08:14:52', '2023-03-24 08:14:52', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-15', '2023-03-15 07:39:19', '2023-03-15 17:06:37', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-13', '2023-03-13 07:33:24', '2023-03-13 17:15:22', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47911887175708', '2023-03-03', '2023-03-03 07:42:42', '2023-03-03 10:03:31', 2.3);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-01', '2023-03-01 07:57:03', '2023-03-01 17:22:23', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-20', '2023-03-20 08:19:51', '2023-03-20 11:25:27', 3.1);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-02', '2023-03-02 07:32:26', '2023-03-02 17:10:45', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Thị Sang', '2023-03-29', '2023-03-29 08:00:20', '2023-03-29 17:11:42', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phạm Văn Quân', '2023-03-15', '2023-03-15 13:06:09', '2023-03-15 17:06:16', 4.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-10', '2023-03-10 07:55:56', '2023-03-10 07:55:56', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-15', '2023-03-15 07:47:52', '2023-03-15 17:19:47', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-08', '2023-03-08 07:45:26', '2023-03-08 17:17:40', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-08', '2023-03-08 17:02:18', '2023-03-08 17:02:18', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-22', '2023-03-22 14:42:28', '2023-03-22 17:09:26', 2.4);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-20', '2023-03-20 08:01:00', '2023-03-20 17:08:15', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Sỹ Thao', '2023-03-09', '2023-03-09 08:10:14', '2023-03-09 08:10:14', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-10', '2023-03-10 07:50:28', '2023-03-10 17:08:36', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-06', '2023-03-06 07:58:51', '2023-03-06 17:17:32', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-28', '2023-03-28 07:31:26', '2023-03-28 17:07:32', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-31', '2023-03-31 07:59:53', '2023-03-31 17:07:59', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-20', '2023-03-20 08:09:24', '2023-03-20 17:21:28', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-13', '2023-03-13 12:31:31', '2023-03-13 12:31:31', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-17', '2023-03-17 07:51:00', '2023-03-17 17:02:32', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-21', '2023-03-21 07:12:12', '2023-03-21 07:12:12', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-22', '2023-03-22 07:48:26', '2023-03-22 17:05:13', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-31', '2023-03-31 07:57:26', '2023-03-31 07:57:26', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-21', '2023-03-21 15:20:56', '2023-03-21 17:50:06', 2.5);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Sỹ Thao', '2023-03-22', '2023-03-22 07:42:00', '2023-03-22 16:39:57', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Hoàng-intern', '2023-03-02', '2023-03-02 17:11:06', '2023-03-02 17:11:06', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47911887175708', '2023-03-06', '2023-03-06 07:55:06', '2023-03-06 07:55:06', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-01', '2023-03-01 09:10:19', '2023-03-01 17:22:44', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phạm Văn Quân', '2023-03-02', '2023-03-02 08:03:43', '2023-03-02 08:03:43', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Văn Hoàn', '2023-03-24', '2023-03-24 08:01:38', '2023-03-24 17:02:41', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-16', '2023-03-16 08:16:59', '2023-03-16 17:30:45', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Văn Dũng', '2023-03-06', '2023-03-06 07:50:31', '2023-03-06 17:16:02', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Hoàng-intern', '2023-03-23', '2023-03-23 07:59:53', '2023-03-23 07:59:53', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-08', '2023-03-08 07:59:36', '2023-03-08 07:59:36', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Hoàng-intern', '2023-03-10', '2023-03-10 07:53:56', '2023-03-10 17:03:18', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-17', '2023-03-17 08:10:19', '2023-03-17 08:10:19', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-06', '2023-03-06 07:40:31', '2023-03-06 17:15:55', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Sỹ Thao', '2023-03-14', '2023-03-14 16:13:03', '2023-03-14 16:13:03', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-24', '2023-03-24 07:39:59', '2023-03-24 17:01:08', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-17', '2023-03-17 07:53:10', '2023-03-17 17:10:34', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-28', '2023-03-28 08:30:31', '2023-03-28 17:15:26', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phạm Văn Quân', '2023-03-03', '2023-03-03 08:02:17', '2023-03-03 14:25:46', 6.4);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Thân Công Đạt', '2023-03-30', '2023-03-30 08:01:18', '2023-03-30 17:12:19', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-14', '2023-03-14 07:54:07', '2023-03-14 17:03:18', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Sỹ Thao', '2023-03-10', '2023-03-10 12:44:16', '2023-03-10 12:44:16', 0.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-22', '2023-03-22 08:09:09', '2023-03-22 17:46:51', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Đường Đức Thanh', '2023-03-10', '2023-03-10 07:27:14', '2023-03-10 17:08:10', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-21', '2023-03-21 07:40:24', '2023-03-21 17:03:30', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, '47396050173971', '2023-03-15', '2023-03-15 08:02:02', '2023-03-15 17:27:55', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Phan Đình Hiệp', '2023-03-07', '2023-03-07 08:23:04', '2023-03-07 17:37:04', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-22', '2023-03-22 07:55:27', '2023-03-22 17:18:50', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Hoàng Hảo', '2023-03-23', '2023-03-23 07:56:22', '2023-03-23 17:42:42', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Trần Hữu Hùng', '2023-03-24', '2023-03-24 08:01:36', '2023-03-24 17:07:20', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Ngô Thành Trung', '2023-03-20', '2023-03-20 07:53:50', '2023-03-20 17:57:19', 8.0);
INSERT INTO public.timesheets_details_tb (username, fullname, date, checkin, checkout, working_hours) VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-01', '2023-03-01 07:56:53', '2023-03-01 16:10:06', 8.0);


--
-- TOC entry 3391 (class 0 OID 16422)
-- Dependencies: 221
-- Data for Name: timesheets_raw_data_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3392 (class 0 OID 16425)
-- Dependencies: 222
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
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('DatTC', 'Thân Công Đạt', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 0.0, 8.0, 8.0, NULL, NULL, 8.0, 0.0, 8.0, 8.0, 0.0, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 8.0, 18.0, 144.0);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('QuangNM', 'Nguyễn Minh Quang', 2023, 3, 8.0, 0.0, 7.2, NULL, NULL, 8.0, 8.0, 0.0, 8.0, 8.0, NULL, NULL, 0.0, 8.0, 8.0, 0.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, 19.0, 151.2);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('TuanLQ', 'Lê Quốc Tuấn', 2023, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7.0, 56.0);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('HiepPD', 'Phan Đình Hiệp', 2023, 3, 0.0, 0.0, 0.0, NULL, NULL, 8.0, 8.0, NULL, 8.0, 0.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, NULL, NULL, 3.1, 8.0, 8.0, 8.0, 0.0, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 0.0, 14.0, 107.1);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('HaiNV', 'Nguyễn Văn Hải', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 0.0, 8.0, 8.0, 8.0, NULL, NULL, NULL, 0.0, 8.0, 0.0, 0.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, 17.0, 136.0);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('ThaoLS', 'Lê Sỹ Thao', 2023, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.1, 0.0, 0.0, NULL, NULL, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8.0, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, 2.0, 8.1);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('ThienLTH', 'Lê Trương Huỳnh Thiên', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, NULL, NULL, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 5.4, 8.0, 8.0, 20.0, 157.4);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('LuanND', 'Nguyễn Đình Luân', 2023, 3, 0.0, 0.0, NULL, NULL, NULL, NULL, 0.0, 0.0, 8.0, 0.0, NULL, NULL, 0.0, NULL, NULL, 8.0, NULL, NULL, NULL, 8.0, 2.5, 8.0, 8.0, 8.0, NULL, NULL, 0.0, 0.0, 8.0, 8.0, 8.0, 10.0, 74.5);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('ThanhDD', 'Đường Đức Thanh', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, 23.0, 184.0);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('DungLV', 'Lê Văn Dũng', 2023, 3, 0.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 4.2, NULL, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16.0, 124.2);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('DatNT', 'Nguyễn Thành Đạt', 2023, 3, NULL, NULL, NULL, NULL, NULL, NULL, 1.1, 0.0, 8.0, 8.0, NULL, NULL, 8.0, 0.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 0.0, 0.0, NULL, NULL, 8.0, NULL, NULL, NULL, NULL, 11.0, 81.1);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('VyTTH', 'Trần Thị Hiền Vy', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, NULL, 8.0, 0.0, 8.0, 8.0, NULL, NULL, 6.9, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, 21.0, 166.9);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('HaoH', 'Hoàng Hảo', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 0.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17.0, 136.0);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('SangLT', 'Lê Thị Sang', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 0.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, NULL, NULL, 8.0, 0.0, 8.0, 8.0, 8.0, 20.0, 160.0);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('ChuongLV', 'Lê Văn Chương', 2023, 3, NULL, 0.0, 0.0, NULL, NULL, 8.0, 8.0, 0.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 0.0, NULL, 8.0, 8.0, NULL, NULL, 0.0, 0.0, 8.0, 8.0, NULL, 14.0, 112.0);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('HungTH', 'Trần Hữu Hùng', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, NULL, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 0.0, 8.0, NULL, NULL, 8.0, NULL, NULL, 8.0, 8.0, 18.0, 144.0);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('TrungNT', 'Ngô Thành Trung', 2023, 3, NULL, 1.6, 0.0, NULL, NULL, NULL, 0.0, 0.0, 8.0, NULL, NULL, NULL, 8.0, 0.0, 0.0, 8.0, NULL, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, NULL, NULL, 8.0, 0.0, 8.0, 5.9, NULL, 11.0, 79.5);
INSERT INTO public.timesheets_tb (username, fullname, year, month, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, total_working_days, total_working_hours) VALUES ('HoanTV', 'Trần Văn Hoàn', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 6.7, NULL, NULL, NULL, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, 21.0, 166.7);


--
-- TOC entry 3393 (class 0 OID 16428)
-- Dependencies: 223
-- Data for Name: user_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('ThanhDT', 'c30f02adc000b565f761a2b292b37169', 'Đỗ Tấn Thành', '2023-04-26', '132527', '51246768', '7654', '76543', '76543', '6543', '87654', '87654', '2023-04-26', '', 'User', '\xffd8ffe000104a46494600010101006000600000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc000110800cf00a803012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f7fa28a2800a28a2800ae4e7f1b40fa85f59592ee7b297c999da362a1bb8e38fd6bac270326b8af00db249e1f935175064d4af27bd638ea1dcedff00c742d0069d96bd25d4815a68467b28ff00ebd6d0772bc49cfd0545e4c5ff003cd7f2a73c71e71e5a71fec8a6221bbbab8b784b2cb1138e3721ff001ae6a6f1f7d8e6293da4722af568e5c1fc88feb5b9ab451adae446832bd945799ea233338a2c07aed85ec5a8d843790e7cb95772e7ad59ae6bc093f9be158109c985de33f9e7fad74b486148480327a52d6378b6f4e9de10d62ed4e1e2b394a7fbdb4e3f5c50037fe129d3e4557b62d711b7dd9232bb4fe39ab96ba9add0caa63ead581e1ff0969da778774fb392d633245022bb15e4b63939fae6b6a0d32de171e5f983e9237f8d302f991b1c283f8d54bbd516cd774b048477d854e3f322a50832065baff78d60f889408586e7ff00becd022edbf8b7489e6109b8686427004a84027ebd3f5adcaf0dbd5018b8eaad9049cd7b5d9cdf69b2827ff9e91abfe6334013d1451486145145001451450065789af4e9be16d5af41c341692c8a7dc29c7eb50787ad069fe1dd3acc2edf22da38c8f70a0550f88d308bc177519cff00a44d041803248795011f913526937ae9198e524c7136c66d8db893fc449edfcb38edcb0377bd2b9cb9a80be24080f3efdc54a4e28114b5739b4ff80d7996a1c4ee4d7a46aae3eca4f5c8e315e65a9b9172dc654726806769f0e670d657d6e0fdc9438ff810ff00eb576d5e67f0d6effe26d7b6e481ba0570a3b608ff001af4ca18d0572fe3c6126876d607fe5fafedadcfd3cc0cdff8ea9aea2b8af1c5c11adf86ad848a84dc4d71c91fc1195fcff799fa81480ea97ee8a72fdeacfd3f504bb8130554ba6e41bc3161dcf1ef56d24dcf81823d8f4a62241d47d6b0bc49feadeb6c9ac1f10b0f248cf2450079ddc804b03debd57c273fda3c2f60e4e488f61fc0e3fa5792de4803b860783c7b9af46f8797227f0e32646629dd700f4e87fad0c11d6d1451486145148eca88cec70aa324fa0a005a2bceb42d47c43e25d12df56922545b925d116665f93271f2f4e95d169f15cc6f89ad0e7fbdf29feb4ec051f886eff62d1a18d124697548f0920254ed477e71ce3283a559d36da3b7549618ff00d0ca0313312a403db07047e23d3a77d8961826d9e759abec6dcbb914ed3ea3d0d65eac52dedf10c2f105e9e59d98fc8d02354371f29c8f53da90e3a16c83dabcd25f126ab6531786e25d808ca4a43023f1c9fd6bd1ade5135ac337043a061f88cd0055d5062ddb9e31d2bcd35355333ee2464f6af4bd4f8b661df15e6da8644e40f5e698177c04fe4f8c42121f7c2ebbcf518c103f43fe15eb75e21e18d42db48f169beb86096d0db4d34cd939015492718fa7e55e849e348ee563920112c7228642ec7241ef838a4c11d6d701e2b68ee3c79a75bccde5a45a6cc44de66c11991d406ea33f7318ef9aebac751374809dbff011ff00d7aa17de1e179aff00f6aadd34729b55b5d9b01180fbf3f5a062e9f1b460accb2232b9dbb8823ea3ebd73efdab438c9c280debeb597a85ecfa7a067114e01cf2361fcf9acdb2f18da5d5ec765242d049236d421c3ae7b0ec7f4a0474ac370c31fcab0b5e07ecedbbf4adc3d7a7cd587af9ff004661dfb9a00f39bb8cb31018039c804645769f0b9f169a9c2570cb32b373c1247240f4ae3aebefb8c0c01c9ae97e143626d5a2c1c2f978c9078e71d3f950c11e974514521856278c6edacbc1bac4e99f305a48a98fef3290bfa915b75caf8fa45fec2b5b4660ab77a85b44c7fd912076ff00c750d0069e8d649a6e8b65628005b7812218ff006540abebf785451babc4ae0fca46413e94f5386a620279ac8f10ff00aa7fa56b1ac7d7cee818fb50079adeaef320f5af47f0e4e67f0f58c98e9104fcb8fe95e7378db5db8cfb576fe0b9f7787f61e914acbd7b75feb4c0d6d5815b439ee38af34d45b123b1cfe15e8daa4c1a02b9fb8a6bce2fe4549dcb1c738fce8031ae6ddae31650ed8deefcbb6600727cc91148ff00be777e55ee71595b450a4690a044015540e8074af1bf0c5bbddf8b34cdec644fb5bcb9238c471b71f8164fcebdac5260471da5ba312b0460e3aed14e58622e33147ff7c8a7a9ebf4a4538607de80395f12c71ac6c046831fec8ae10c86def209d78f2a556e3d8d77de27fb8d5e7d738dac3bf6a607b029c81efd0d61f887e5848239ef5a3a75c79da55a4bdda25391eb8acbd7e512c2efd72302803cf6f31928413b8e302bb2f86306c6d5a45551117455c752403926b8bbc97623e1807c120919e9df15e89f0dad1e0f0b2cf2125ee2567dc7a9038fe60d261d4ec68a28a430ae23c7f29fed1f0ec3e579a8b732dd489eab1c4c0ffe875dbd705e2f727c71a2a8700c16373305690a063be100123d71d3bf4ef401afa3c932c6bbfe663c4a589271d8e7a03ea3d49ad755612648181d083552da0109792190b076dcc84f0b9e48c633d7d79ab59e32781fdda621cce00e39f6ac5d758fd98e318c735b19c1c01c563eb607d9dc8e32393401e677ec449210d827800d74fe02bb416d7f6f281f24c1933d1b3e9fa573d743321ca82b9e7350687acdb6932dc5c4922c48080be61c05e09eddce33f95303d17579540c6ee100dc41eec78fd715e5fafea11dbcd2163961b426064ee248181eb59facfc5cd3c5b4e2d8c9712ca72bb5080318c649fe99e957fe15f87eff00c6de211e2bd621f2b4cb47cda41ced9241d0fb85e79f5fc695c2c74963a749a2eb3a4d9499fb4c1a5c9773228392f2c8bf2e47a796abea4035e8f6977f688c6e61bcaf98bb41c153d0827ad7237a915f7c48d4e2b848f6a5bda431c8d9dcac0bbe06077dd83c8e3d6ba8b00d144a93a79331192bbc1fd33803e9fa5005d8e4de5b0411edda9e4e29b927dbde98406ea72474a00e73c48c0a30efdebcf2e65c1c30c12dc66bd03c479f24e7923debcfee63249d926d700904e2981e85e15bc8aebc3965f3299154a1c76c139aafadcca44a43614e76fa71c1ff003ed5c5d978aacfc37a248d33ac38247525b05b00e3f5c5723aefc59b77b78e0b081e791493961b579078f538247e5480db90bea7ab5be9969cddddca634ef8009c9fa0ea6bdeec2ce2d3f4fb7b38462282358d7e8062bcc7e0ff00832f2ce193c53aea91a95ea9f221618f222273d3b13fcbeb5eaf4300a28a290c2bce3c691a3fc40d21a561e5269d3b3a938debbd1587e4c4fe15e8f5c078de31178e3c2376e5844ed716cd862b962aae8091d894a00e9b4ff2040be5b2b67e62770259bb9a9c309be756caf4208aa96e564b66729242adf3b4527ca57d7a74e73d383f8d5989e360ac9f708eb9ff0039a621ff004e9deb1f5cff008f661dbb56be30324fd6b23c4036c2501ed9a6079cde6048cc7271d00ac727595b4d4974b3691c93c411def240811486059391823031d47d6b5eec16660a71cf27dab3f542c3c09e27bfb69e58e66586da368df01c3c810a9c750771a181cd7c3df85379e2cd65efb51753a3c6ff0034e8dfebd87509c0e3b67a7a66be9eb2b3b6d3aca1b3b38521b78502471a0c0503b556d0b4b8745d0ac74d80623b681231ef818cfd4d68548cf3432dc7fc2cdd7a18b0119ad9d8938076c4bf2e7b1c313ff01f7aeea0593ca5599c3ba8c3301804ff008570e6267f8a7aedbc922c50bc56b72189c1cec68c6011cf3c7ffaf8ec13cd78555cf2dc364e07be303ad311639dd8e40078c8a0f7c0c37ad229c2942c1ca8e79e4d28c9f97f8a8039af11f3111f9d70176034722b03b08c100727e95def89385231db15c15c857916361904f4a6073bacc7a9dd78424861bfb0b2b14b82d3bcccdbd8f6552aa720e4718ebf4adef84ff077ca30ebde25815886f32d6d5867e8ce0fe607e74d8f4b1a96a1e11d35d9becd77abcd3342ac7cb68e140c32bd09ebce3a1c57bd8e0548c3a0c51451400514514005711f156c64b8f0636a102869f49b88f5040467210fcdc7fba58fe15dbd473c31dcc124132078a4528eac38604608a00e5349d67edda4d9dd4324772d344a5597e50d91904f2718e8793c9ada173199cc0482ea0338ec01cff85793f866687c0de2ad47c15a8ed8a369bed7a5ceff00f2d11ba0c9ee318fc0d7a2437504d7afbd17cd68fe7ee1803c5311a8ee176ed2486e78e462b0f5994989c1386c0c7d2afbdfab5c1831c6d0c5bb639ff01f9d606b17e8f1b4a08db231419f403afe9fad30389bf9c46cebb7239cfd3d2abc904a9e1196cdc2aa5d5de9ce8a071b5ae063f03b73f8d56b5dfe25f1743a05a9626490b5c329ff00551003249f5ec2bb6f17db456fe21b4b58902c7f6cd211100e0013b71f92d203d4874a28a290cf35f1a6dd2be22e89a8c90996d751b4974f9d047bf7153bd063d4ee38fa575fe6c2c82232955623660904e7b7e86b37e23f87a7f10f84664b2c8d46ce45bcb361d7cc4e71f88c8fc6b1fc11afa6bda058ead24cb24db0a5c2aa63cb93386e33c74fd73de9a03b40001b43107ae3ae71fe4534c9b08278239aa36a1c34d99f39949c819f949c81f91153bc913ca70c0b7f17b63fc8a6239ef113ef89d87f11e2bcfefe5220711c9b1c8e0e324576badcca629183707e651db692715c369d6a7c41e21b3d260ce6621e761fc310fbc7f2c81ee68036fc35b67f15781f6676c4ba931e3b85443fcebd92bcc7438d57e2458448a15615d5d8003800dcc62bd3aa46145145001451450014514500705f14fe1fa78e34006d76c7abd9e5ed253c6ef5427d0e073d881ef5f3de9be35f11e8776f67a85c664b663134576583c783c838e4fe39afb06bcffc7bf0db47f11bbeb06c11f508e3c3edca999476e08f9b1d09cfa7d0038493c4dae7fc22736b7f648c4000d8e4ba29dc401cb01d7239f7af34bbf1bf893c41711e9fa7c663791c2a25be59d9893d09ce3af6aeaf57d03c3917854df36a57d3444aac56716af1c859c9c001769f5f4e00af51f865f0b6cfc2100d4ef0197559867e6208b707f85781938ea71f4c5005cf85bf0fc782b44696f489758bcc3dd499cedf4407dbb9ee6a978d0ffc567a77bea3a60ffc8931af4baf33f18e0f8b74f933d359d363ff00d0cff5a00f4ca28a2800af9ffc7d69ac7c2ef154be20d11049a16a92efb8b723e48e63d7a7ddcf241fa8ec2be80aa7aae9767ad69971a76a1024f6b708524461d47f43efda803c4342f8bfa65c17f38fd93cc60764b93b4e00382074c8ad8bcf881a4d9d8c971f6c882ced8e18e49233e99f5ae17c41f09758f0c6b0c6cf5157d3b7eeb63348d1ee039d8cc38040cf7191c8f687c64be23bdd06dade7b3d22d6ce0240306a0b23ca48e061e4258fa60668024f117c54b79b65be9911ba9150c61802a84f1823b9efc6057ac7c24f065cf87f466d575704eb1a82a9756eb0c63eea7b7a9ffeb572df08fe10ff0067791e20f115a81763e7b6b57e767a3b0f5f41dbafd3dc2803ccf4039f8a3181d3c8d53ff4ad2bd32bccfc3ecbff000b3ad987592cb527fcef16bd32800a28a2800a28a2800a28a2800a28a2803c7357b54b893c31a395530c5e299005c7f04465207d318af63af2996232fc41d0a3c6426bb7d211f4858ff5af56a002bc9fc6729ff84821901e22f13e9aac4761e583ff00b357ac57cffe3ad42e1f4dd7aed57fd1e0d79643283d1e278e351f906fca803e80ed452230645653904641a5a0028a28a00c5f16e9ff00da5e15d4a05c89440d242c00256451b948cfb815e73fd9dfdaff00123c236925e4f756905849a9b24c131bb8553f2a8cf2475af5d9577c4ea7a1522bcafc0f99bc79a5b9e7cbf0a4639ff6a6ff00ec6803d5e8a2b3f5bbe4d3f43d42ecb01f67b69253cff7549a00f34f0d4ea7e20f86272fc5e6917653271b89955ff9735eb75f3f68578b6be2df87139bb8a68da39a250adfead5a08d029ff8164fe35efe1d5ba303f8d003a8a28a0028a28a0028a28a0028a28a00f33419f8a1a5afa5fdfbff00e4041ffb357a18ba4977795226d5254b67b8e08af3c8b27e2ae96474375a97e91c42b6acb518b4eb85d1f54c5b5dab116ef21c25d203c321e85b18caf507b6304806ceafa9ae99a55d5f61e5f22269368079c027b7f81af9e6f2c2db51f036a7abff006c1792e8fda1ec619b96b9761fc04ff789edd2be806d52d04659e64001c1c9efe95c35e78abe1ccf745ee6db4d92e3701be4b2cb93cfaae4f7a62353e16f8aee3c59e1359ae97cabcb4616f2856387c2821bf1cfe60d77027923e5be703a8039ac7d0f52d3b50d323b8d2ca7d9325542c6500c76c102a5d4b5bb1d22157ba9bf7921db14118dd24adfdd451cb1fa5017372295268c3a1ca9e869f543465b95d3236bc411cf23348d1020f97b98b05c8ea403827d7357e90c0f4af2bf044b1daf881ee5c12b6fe1cb45381c9ccb29c0fae057aa5795782ad1751d5754b3666412685628245fbc9969b047b83cfe1401e8c2e56500b06dc467674c572bf10c6af3f8566b6d1ed1e7695d1668e223718b396001eb91c63d09a75c6b979e1f85a3d7ece51e58c2dfdb445e097dce32633ea1b8f463515c78d2d4e96f79a72adf154dc16195483c807919e7fc2988f24f1168c5ed74d5f0ae85aadaeaf15c8b89257b178da22a30155b18ea73d71c75af74f0dc97f73e1cd3e4d620f275230afda10e387ee78e39ebf8d79dc5f166f26bb580787e7de377065001c1c1c1c1cd774de2ad26d6ce1b8bfbfb7b43222b1496500a923a5017375a692dd1a45cba28cb2f538f6abe0865041c82320d71e9aadd78917ecfa2413c76527cb36a53c66350bdc44ad867623a36368eb93d2baf8e358a258d061500503d00a431d4514500145145001451450079941229f897a09eef73ab0cfd0a8fe95e897fa759ea968f697f6b0dcdbbfde8e640ca7f035e536f771ffc277e0ebb2d85b9bed59509ff006c923f3af5fa00e3e5f877a7479feccd4352d38673e5c53892307d9650d8fc3159d37c25d22642cf712b5cf044cd1af0467070001dcd7a0d1401c35a7c396860fb3cde25d50db64910db2c502f3eea9bbf5ae8347f0ae8da1cad3595a0fb4b8c3dccced2ccc3d0bb12d8f6ce2b668a0028a28a004638527d066bcd7e1d284f13df2e7fe60ba71ffd1c7fad7a0ea530b7d2af2724011c0efcfb2935e79e03061f1e6a109e07f61d8607ae378feb401e9b59179e16d03509fcfbbd1ac26987fcb47b752df9e335af4500635cf84f41bc84433e956cf1839dbb303f4a5d3bc29e1fd2583e9fa2d85b38390f1dba86fcf19ad8a2800a28a2800a28a2800a28a8ae674b5b596e24cec890bb63d00c9a0090903ad41737715bdb4b3330db1a339c7a019aac977e6a23491b6f619db9e16b03c716bab6a7e14bdb2d1c27da66509b7ccd84ae46406e832323f13401e33a6eb3646ebc03729a84725c2ea08268377cd0eec2b6475e49fd2be9213c47f8c7e35f3e789fc3dab6ade1c8b4cd3bc2da8da6a2d3acb3cb215651b41fb8e1b032c7a81f957adf8361d5e0f0a585bf883e6d4a342b2b6f0e5b938248ef8c66811d5820f4a5aa19923f9a13923f849e0d5b8265b8b78e64fbb22861f423340c928a28a0028a64922451979182a8ea49a89a524677041f99a00c6f1ddcfd93c07ae4bb829fb14a809f5652a3f535c1785af254f8cd1473c661371a01458cf7093b053ff7c8cfe35a7f15b5681741b7d12594a2ea93ac324acfb3622fcc483d3390a3e84fa579aeb77f7be00f16683ae3dec9ab5c2c0f1cea5c1558390a030039e5cf39e45007d2b4566da5d7daad21ba8262d0cc8b2213ce411915652eb0ea92e14b701bb13401668a28a0028a28a0028a28a002a2b8823bab696de65dd14a851d7d411822a5a28038a9aeb57f0dc461d42cee751b34188afed23def8ede6c63e6cffb4a083d70bd2a8b78f2ce7b091f4f786e2e554910998290c3b303f303f857a1d52bcd1b4bd45835f69d69724743340ae47e62803c7bfe1686be6e9613a0a83b9be6f30ed38c7b7bd76d178df47b7d36d67d4f50b5b4b896352f099412ac7a81dcd74b3787744b983c89b49b2922fee340a47e58a758787f46d2ff00e41fa4d8da9eb982dd50fe828158e7e3d5351f110f2744b5b8b5b36e24d4aea231e17fe99237cccde8480a3af3d2bacb6b78ed2d62b78576c51204419e800c0a968a06145145006578863b97d259ed2133cb14892f9208cc815812067be338f702b3ec759d3ef2d8dcdb5c2b2a9d9229f95a36feeb29e54fb1ae96b0b59f0868bae4df68bab531dd6302eade468a5c7a1652091ec7228033f5cd4b428f4f275936b25ab100acc81c13cf6c1f435ca59df7c328eed1ed6db4759382acb0838f4edc77adeb9f872f3fee8ebd7335b12331dcdbc6edc74f9d429efdf3598df076ce0757d37508ed9f003192d7ccce3a10378f53eb4c5a9dda3000280001dab2eff548e4bc4d1ac889f5090ab3227cc2dd33cc8ffddc7607a9c63b91513c093dc156d57c4dab5d01d638196d90ff00df0377fe3d5d1e95a369da25afd9b4db48ada2ce4841cb1f563d58fb9c9a065ea28a29005145140051451401ffd9', false, 'MKTNone', 'PM');
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('ThaoLS', 'c30f02adc000b565f761a2b292b37169', 'Lê Sỹ Thao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('ThienLTH', 'c30f02adc000b565f761a2b292b37169', 'Lê Trương Huỳnh Thiên', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('TrungNT', 'c30f02adc000b565f761a2b292b37169', 'Ngô Thành Trung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('vitrannhat1', 'c30f02adc000b565f761a2b292b37169', 'Trần Nhật Vĩ', '2001-08-10', 'vitrannhat1@gmail.com', '0919562182', 'An Khe, Thanh Khe', 'Kinh', 'Lương', '233316603', 'None', 'None', '2023-04-16', 'None', 'Admin', '\xffd8ffe000104a46494600010101006000600000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc000110800d500a803012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00a34514568677034d34ee28e2905c6525388a4a603734734b476a431b462973466801452d3734b400b4f514ca72b6290c92908a4de290b530143e297cccf7a8f3494012ee14848f5a8b346680242c05151d14ec03f345368a2c48a68c52668cd00183460d2eea334804a4a5cd26698099a4a0d30f5eb40c534a1b14ca2901279946fa8a8e68192ef14bbc7ad43cd18a0098b8a697a8a971400fdd46ea6d1400b9a28a281684b4519a370a6485149b85216a2c02d19a66ea3752b00ecd14dcd26ea6171c69a68cd250019a28a28185145140051451458028a28a2c30a5cd2519a2c02e68a6d1458053203c8acfbfd5a2b45c290ef9c601e9f5a8b55bbfb3d8b3464ef270b8ae3a59a476dd231c93cd44e56d1127756fa8c13c60f98a1b1c827155b51bc9788adbe6246720fbfad71c93e2455dc719c1e6b552e83caa4284452071f8d4f3b6acca8abb3a2d3ee67903a5caaaba63a1eb45b9923bdbd7966261caec07a2f1cd604d3cb1cc1a194e48c63d6a292e2573b9d9c64609c9e6ab9eda15ca74a754b70f80e08f515560d6019641361540017dfd6b8f96f0f9e1318c0c0a8dae581ebef4eec3951dfa6ab66e71e7a83ef56c3ab0ca9c83dc579a89ce720f3e95afa36b4d69388e425e16ea0f63ea29a62713b3dd46ea84df4780553231d68fb62774abb333b936ea5dd51c73c5229650303be697cf880c9c7e740c7e4526f1bb6fb66aacf7821f9b03cb3d1c1c8fc6aaaea4a6624e3031803bd43921d8d5c8a322a91bf8963decc0e0f2179c52fdb60c64c8a38cf26aae8352e6452645534bf8249bca59016c66924bf8e39963c8249e79e945d08bb9a2a013a1fe21f9d14ec1739cd5ae0bc4565c0c72086c907deb9a24b13b464f5c569cb12491953377eb8a5b5b1f3480b961fdec572a4fa9a4a2db2adada969172327ff41ad1f2444c22ddb9645ce0f639ed535ccb0da46b1c40162393543cc77984acabc7407b55148bb1463cbf30e1b07a9eb4db8991576841c0e01e7b50d7f2bfeed224de70000bfd2b6b4df0d810f9d7ac5a67070a7f87ff00af424c77385b80fb95ba6e19a87711d4e6ba99b4a944f1a98448c3e43bb80003e952dd787e0781963508e7d3d68f6896869ec9bd8e4c30f5fa52aca0f43835bb1f87a3880f3b2eec7006700573f751ac3732ac64ed472a3f3aa524de844a0e2aeceaadb5069ec1118608c1df9ec2a692f66e369271dc0eb542c22692d95107cc8b961fd6a68ee59632802151cf279350e52ee47226695b25c4962e540555fbbc72df4aabfda3246b856ce383bc62abc7a94f131da081db9e955a5ba794146638ce703a54de60e2adb0e96ee5ddbc17e4ff0009e0d2c133066deb953d486e7e9545b786fddb919ef52a4440667724fbd0d126f7da23b855586d82c6bc64b720fbd63de5d932b6e3b7e9482e1d63d8ac42f278a81521dc4cc1df23b3628b32ecda1d0dc7ef7729f9beb522de33cbf375ee4b75a802db2821627cf625b38a915d1171e58c1f51d69d81459bc866fb30033bcf43d851592ba9489c8193eac4f1456c9c6dadc4e2fa0e82dbcd39701547af6fad4b3ce147956e46deed49712899800bb231d1477fad440607247b0acca23f2c67249627b9a690cce238d4b39381819a9ede09afa6f26dd493ddbb0fc6baed2f48b7d3d14e37cc4619f1fa531322d13424b18c4f70a1ae5bf1dbf4ada037373c2d37962067e5079f7a94c7b90a9e84550886e2dadd892bb437739ac9ba845baee120624e071d2ac6de482c770e3a74a82f2e12dedf2c32e4e073d3deb2924d1bc1bbd8a4ee50e368dd8e09ed5c7c1642e7c4eb66dd249b9fa6735d644c269431e954b50b292daf86a56bc4a3e5240fbbc633514dd9975537136759d044e8d7366a1271f7907471fe35ca33b1254aed20fcc08eff0095751a7eb33c20c777ba4da325f1ca8f7f5a83558f4ad497ed16b750a5d0eaac7687fae6b668e74ec6141079a7738db18efeb56e37b68d9b70e3b719aa17172fd0fc98e30a7d2990ce88a300ab03d3390c3fc696a3df734de7b528404393d3e5ac9772d77e50ea79e6b6018e5855933cf502aacb6d975719deb93c1eb52c4e254557925f2a3562dd95466a5fb15d83fea66e3fd935752dadeed5a48f7230c1cff74d6be9534ac6486ed14ec036ca07defad5213938a39a1637647fa89bfef9340b2bbc7304c7fe026bb17bcd3a33892e2043e8cc0544d7f65ff2cde1707a10411435627da3ec7246caec67f7130ff801a2bad37f6385f9e324f51e9452ba0f6afb1ca336de98271924f4a7da595c6a92854c6c1d5bb0ab5a4e913dd9f365188875fe95d7416ab14223440bedd2a922ae374ed3e0b2b558a2fbddce3926aec6848c1e9eb4d894ed0393ea6ac01815561081476a763de968edcd31197a8a4b0ee9638cb237248fe1fc2b9cd543fda60591d76b2e7603f303ef5d0eadae5be9aa51712dc6388c1e9f5af359b55b97d40c970d90ce59801d33e95128dd1ac24ee7630050176d43a8dffd96d4b797e6678da0e38acbfedfb58a10725dc7455159736a575791c92b61632760503a66b2841b7766b3a8ad645cb7d4249c08e11e5239cbbbb64e075abb1a078c398c3ef390b8e76fad642d9c896c0061b9be51ec3bd5eb3bb9606112aee690617d876ae847313368d235e1553ba1fbd9cf38aaf77a6b42ccf0723a947eff00435a5a7cd3c32a09096578cab807a115b12dbc5360142c186e19e78f63498ce42d2f1edc92a48cf0cbdc5691759955d642ca41e73f77ebe945f69f0b4a62cfcf9f9197aa8f7f5ac968ee2c9c3b7ddfef81c7e3e959ce3ccb40b96fcf2272e849cfdec77abf0df0e137c7b88c70724d62fda66193b8103902acc574f2619d80507a9e2a799add07317255b7b82a675cb371cd516c42580c055e063a53f866189324741ef4985236b8c9f5cf4a526985fb0cde642bc9e3b8a2a3650af8072073c8c514ac33d2c46a57ca8fe554ec29c919c639da2ab586a306a5713ac0d98e2232dfde273d3db8ad1ce3e95d0486303814a3dc5212050f32a46598e15464d3109248b1465d8aaa819249c62b99d4bc48d26e86c1801d0cbdcffba3fad666afa8dcea32b6e622df3fbb41d08f53eb59c7e51c8009fcea5b2921924c2065dd9691f73313c9ff003d6b16ee55951180e48fea6b564b98cdc4a187dc8b038f6159577e5fd9a028304e734fa0d6e54ebdeae0f303456aa390c188f7aac9f781c640e4d5a85a6372262bcb1245316c5d91ae0719383f28ad34543681a23b5d48507bf6acc13c935c408a39058fe94eb58e536658372ae09e7dc5005fb7b6612dd113309946e539e9c574ba448d35b461dc068c608c7b022b975b5996ea49377ccd19e33e95b5a03cad23a3004b2a9fc850c0d19a35593cc1b4b8effd2b3a7b713dda858d56361f311d0d5cb8216e19951ba679e87069d6d2893198ce320640a911c9ea5a7fd95d5a2520313f2678e3d2a92c85d48cf43ca9ed5ddc9691cf94588155049523b9ac1d474442e16356caa8c903057dfe949ab818a8cff7be50fbb8c54d2cc43823072b90454491342ce9264a9180cbdaa7b6891936b92ca0d66e3615ac226248f0cbb8f5e28ad4b7b648149fe3232a5b818c1e68a9bd8bb13784ae3ecf7f3c19f95cafe3fe735dbd799696e5758b76dd8dc40c9ec7a7f3aec4eb373146c24b6cb038ddd8fe19add31496a6db1a86464652af8dac3183deb01b5cbd6e42463f0acebcbcbcbada5cf08db978e87f2a2e2b0bab4515a5d3244c7cb03383cedaa2abe6aaed20b134e32c9279fe79cbc8339f538a8245788ef8c95206703bd2dc6523e50f399c82c633cfe5505c5923db2147e557818ce49e829562599a6dc190ec1f29ec6af5b5a85bb40dcaae0ff3a72d102dcc396136f1a8de199c761d0707fcfd2b4cdc089218c8019622467d739aaa768bb48befac44e5bd40abd3c50cf7600e36c58a10d95bed891cd148a064464003d4d3ad92f6181888d8f9adc71c555302fd9d7072e3eee3d735712e2f1238a1901da8e067154b711a121b84bd8c939c467762addadc3a5cdacea4aa97553f42306aa2dd32ea0de62f023e0d2bdc2abf94390d1ab2e3b1c0a00ea2e830b804e02ede99e2aa098c0de546416e0e476f6a88df5cdd9016321081c1aad3bcd6a8e2145dedc991980c7e750d824492ebbf64bcf2d9ce71c92322b522bf82ed1a58c292400c0735c7c96f711e64963c827ef1e41fc6a35ca3e636646cf1b0d24cae5373588e0855668c7cecc0e0761d7a5659b854d4e198e573cfca31f434d7bcb8963559584a17a67ad279504fe54843f9aa700678c734a4f4134d176091e4b920745ea718cf1dbf3a29cb37916d218db2a17a01c64515ced5de885728441239a39423b1525c027008ad19f5bb89327ca8946dddc0ea3f3acb01b621c9e32839a3c93b6318f54fc6ba2e69ca5892fe76c9f3700007e51eb50b3b48c03bb1f9f6f3ef4d014ed078dd956149904719dc473ec4500922d40d10b6749e428ea4a863d01f7a492ea25b333798b90401cfdec7a55704ccd22b7ccd2aee19f5151bd9ac8b0cd27080e3f0ab890f72bdaa1bc9e675ca86c1e4e7bd58dd710dcb36fc2a00483dc532d6131decbf666cc64f14e12b3dc4e9281b7804d3621b6fe41799ce3ee841f89e695e31fda0e55b202543e54525a4db490c64c8fa534dacc2e82c726495c926800b6b66680ca5be7573b07d3bd5bba92e2136d0be4e0f4a6c70fd9b4e170df3485994afe35a115d41757c8932805133cd301209e1ba9a447003088f6ef51605b6a2818160d180bed435aa8b8ba9626e8081523c9e4b23ca325580391ed8a00dbb5b0b89e0571b1508e37353e6d0259a32ad748a0fa2e6afd912f671ba1010e48fcea4696243f3cea3fe0558bdcb30ce957967fea9f7ae39da793501118c8b8b601bb90361ff000ae83fb42d90ff00ad2dec16a29b5481863c82e0ff007b028b8f539a7d3a395b30ce0ffb127ca7f3e9fca920d3ee4b3aadbccd8e3214e2af5d344eaed14011b191b49ab90eab751da45109422aa81c0e68b8ecc8e3f0fdc18388c070380c303e98a2837f3ca706e1dbdb3456765d5872239f6605582f2b8de0d3e4ddb9caafdd01c1a960b1bb93cb68ad663fc2c4270455d87c3fa83ecdd1aa2ed2ad97e6b41dcca90619b6e3230c08f4a6ee688b0078570d9c73fe7ad6f0f0d940a67bc8930b82073fce95ac348807efaf1a42060edef40ae61428c2746070165dbd79c1ab573398e4167f29565f9582f00d4b73369ce3c8b18d9646fbd2313c000d3f4fb17d4ad1198f968bf7587de6c77aae6515a93cae4ec8c3b1b82b7d2154c647ccbe8475a79ff4a926c7ca15f24d3e45fecfd5ee038dc1932a40eb56d348bcb959a5854c513027730c0355756b92e2ef631d2c6567548db9741f9e6add9c73fda4cc8376d3b30dc026b4ade265dc90aec089b43bfde3fe159d2dd882384af0aa3e58c1e49f535422ec6ff6799e5bb41b31c29ed50b2da9125dc6c7739c2ad519efa5d413f7e0471af451dea310cb0209fb7f02d2b8ec4b0b5c24ab0e7827739ab92dca5db98c00327716fe5542da6791242e4228fbe7b9f6ad54b58a7b40530b22a8271dc0a008ceac96b18816291fcb18e5b8a886b57133ed8a28c1c7739a6dfda1b77914f429907db155b4c84b4e9800e54f06b27a5cd5eda16eea7d46350649c264818403bd5bb32f2a6e777ce718cd54bd525630c0821c0233c7e1576d368521b8f42074acf99b8dc8bbe5b95ef65b88ae7ca47c2e01e9cd6ab47147621bcb1bcc63bf7c7359976adf6fe39ca8eb5a06490c0578c2c5dea277b229b7629688a21bc4948c9da7a9a296c9794c9edda8aceac6f20752517646acdaf5d91f2944fa0aa926a1792fdfb86fc2a83dc92a8517ef0cf4e86a09a698c395241231915d561dd175dc9c97663f8d5394920ed19c0e6a3b1b69ae2e4202f23153c66b66df43ba931e6911fcbb413ce4d3068e70c816730b120b7195ed5dc5a32431c70c7d07cb5c5ea7682d7527889cecc0cd7570ce8c81a22bc9c827f9d44cd69685882c6dbce17372aaf3465b683c85e7f9d3afaff16f215c9c0c81eb5496f373346a7e40700fa9ef595ad5e88a2f2958991b802a526d952b2455171792dc480b794a791daa83225b5c969497f7ed8a5924b9948dc08da3e761d4d472472cef192bb509c28f415d47191caff68973129c0e7153db34f7332a97278c283eb566d74fccd3287dadb462a130dc41682519dc8d9047d6815c9a0d38b584ea0fcea7918ad0b684a9b5c30f986d3efc5430ef918bab15924182bea69216b9923b694706293638fc38a009af51c43f39c911119fa64554b0f91a36c13f2f4156a7769209770e46fc7d2a3d2ced78cf4f939ac67d4d97c224f3091366d0a566195c1e3eb57ed8288dc9c67b73cd549ee59a236cca772ccacc714fdb29ff0056aac3be6b3b7ba4257888b97b962c771f979abc65c59b2a0190bfd39aa500c48c08e98e054865612ba052408b934a4b6093b4511c2a59176f5033c77a29b11c2200704f028a53dc99ee6d5ae8101855e572e17a8ce3afff00ae9faa5ad95be8d3a431a070c30c0f3d453535284428bb2591828cfa74aa9a85dcb359c8be4a4719ebdcf5abe657dcdecfa22b682db354460093b4e315d25cdd1585d99e38c8cb0dcdce6b93b0567bb555665241e54e2b57ec29ce796c13c9e6a275145d8a8c64d68cc0d55fcfd41e4ddbf7807755f55f32d2130c45088c066cf538acebc189547fd335fe55d3d8463ec101c7fcb31fca8ab51c629a0847530a4bcfb0e9f9f2f12e36a83ebeb599049e65bf9f312f234a393f8568eb686e753f243054882f007526a1820863d3dcb10595c1c1edd2ba292f7549f531a92d6c325998bdcaaa7f08fe54c2b394b5e0e0915a05e05b995401f3479aacd7a3ecd6ff002701b19cd6a8c86859d2fdfef7280d3ed8ceda7ce1c160a49e6a69263f6f4c467e64eb50c37ad05cdc4663f94f51f5a3518b745e4b58658632a461b20d5fdcf6c5a409959177153ebfe7155a4bc43a47991a71d08f4e6a4fb7149acb209465c8ee318e450012ca93d834a83190d81ed8cd54b490462362a186d19047d2b4f625c5a4d6f6d1e583304551cfae3f9d50b6b5945c2412ab44cabc86f948c56352c6abe165bd44822161952c46e07d89c7e59a456558d8b28fa9ed4dbf61b917073bf279271fe7351481e491235728a7924564be127ec93c2c1e662318c0e94c2023b0f9417cf4fa53ed63f2e475dfbfbe454b36562566da091f2e3e98a18e5f0a2982046b904f23a1a29f1a864c152df2e703a9a28629c1b7746d4112f9287fd9155677f3b4a9dca804315e3d9b14515c90f8be6763d8a5a473a8a0ff0064ff002ae83ca4f377e06edb8cfb5145557f8c54f638fbce644ff717f9575561ff0020eb7ffae6bfca8a2aebfc2854f76727a9dec90eb8eea075008f5a95956e2d24651e58dbc81ce7068a2bba1f0a38e5bb2c476886e51c93cc7cd33c98bfb39b083e56e3f3a28a771227dc52e2ddbd4e3152068e5d45d5e253b939a28a603ec6d6231dc5b3202992454c2d626b5b725075c0f6e08fe94514301fa0c423d443a9e448ff00caba8b9b38afe022545dd83b5b6f2a68a2b92b3f7ce9a6bdc380bd531df98f71651b4f3ef4ede05cac4cb90ea4673d28a2a97c2651f84b823f26e658f76edaa393dea0c37d8d64772e771c67b0e98a28a23aa348a4ec59d29825c0668d24013eeb8c8ed4514532ada1ffd9', false, 'NET', 'Mem');
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('TuanLQ', 'c30f02adc000b565f761a2b292b37169', 'Lê Quốc Tuấn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('ChuongLV', 'c30f02adc000b565f761a2b292b37169', 'Lê Văn Chương', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('DatNT', 'c30f02adc000b565f761a2b292b37169', 'Nguyễn Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('DatTC', 'c30f02adc000b565f761a2b292b37169', 'Thân Công Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('DungLV', 'c30f02adc000b565f761a2b292b37169', 'Lê Văn Dũng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('HaiN', 'c30f02adc000b565f761a2b292b37169', 'Nguyễn Hải', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('HaiNV', 'c30f02adc000b565f761a2b292b37169', 'Nguyễn Văn Hải', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('HaoH', 'c30f02adc000b565f761a2b292b37169', 'Hoàng Hảo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('HiepPD', 'c30f02adc000b565f761a2b292b37169', 'Phan Đình Hiệp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('HoangL', 'c30f02adc000b565f761a2b292b37169', 'Lê Hoàng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('HoanTV', 'c30f02adc000b565f761a2b292b37169', 'Trần Văn Hoàn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('HungTH', 'c30f02adc000b565f761a2b292b37169', 'Trần Hữu Hùng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('LuanND', 'c30f02adc000b565f761a2b292b37169', 'Nguyễn Đình Luân', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('QuangNM', 'c30f02adc000b565f761a2b292b37169', 'Nguyễn Minh Quang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('SangLT', 'c30f02adc000b565f761a2b292b37169', 'Lê Thị Sang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('VyTTH', 'c30f02adc000b565f761a2b292b37169', 'Trần Thị Hiền Vy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Admin', NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb (username, password, fullname, birth_date, email, phone, address, ethnic, religion, citizen_id, tax_code, social_insurance_no, date_hired, contract_no, auth_group_id, photo, gender, team_id, position_id) VALUES ('ThanhDD', 'c30f02adc000b565f761a2b292b37169', 'Đường Đức Thanh', '1997-05-01', 'thanhdd@golineglobal.vn', '0379113210', 'Ngũ Hành Sơn, Đà Nẵng', 'Kinh', 'Không', '1842720757', '550000', 'None', '2023-11-18', 'None', 'Admin', '\xffd8ffe000104a46494600010101006000600000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc000110800cf00a803012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f6c56a76ea8cd37756d622e3d9a9035275a6d3b05c977f15196a42d51934582e4e8f4f273558362a45718a86d21a1f4b8e2a1338078193e9479ed8e76d4ba911d992629454266f714826c8ceff00a52f6887cacb46a22bcd304bfed53b7fbd0aa20e5628e291bd69c0834d619ab534c9699116cd412f119db5348a71f2f5a88a9f2c835a2643225959602c68b67328393de99212202a2a18c88d339209ad52ba21bd4bf8c7145548e72c704d152e2c77363a8a69151bdcc70a92ec062b1efbc4d696b90645c83820726b095448d926cd9dd8a634f12f5719f41cd7113f8b6598ff00a3db3b7bb9c0aaafa96ad71197132c4806095158cabf629533b97bc8c7663efd2aac9aa4519f99e35fab570aa9737126d7b9b8760327e6c002ab5dcd6da7c52cd206648f82ca49c9f41593ab26ed72d53477127882dd4645c47ff0119aa92f89e0c11e739fa2ff00f5abc9a6f16de339091c283b7ca4ff00335464f12ea4e7fe3e31feea28fe95a2a337b93ed228f5e6f11c6dd04e7f1c7f5a89b5e07fe58487eadffd7af1d9355be98fef2ea63edbce2ab79aeed92cc49ee4d3fab7762f6be47b41d6cf6b363f88a6ff006d37fcfa7e78af1d0ef8fbc7a7ad212ddc9a3eaebb8fdabec7b28d7181ff008f3fd454abe22751ff001eae3e95e24652bdcd20ba9147cb2301e9ba9fd5bcc9f6be47b92f8ac29e6de6fcaacc7e3083f8d255fc3ffaf5e10350ba5fbb732afd1cd4f1eb9a9443e5bd9c8f77268f60fa30f68bb1ef5178bb4f7c8776cffb4b5693c41a54a3fe3e917ea0d78441e26bf500bcab20cf21d0575ba65edbea96c8ca89e69fbcaa79fa63ff00d759cb9a9ea6918c67b1e94b776572a7c9ba8d87d695a2665ca6197fd939ae11b4d4401a02db49e4a9c15fa8ab11cda95ab131dde587f0c9d7f3eb551c5490a58747622365eddb3457391f89efedb1f68b5132f729d4515bac55fa197b029cf73a8ea4e44923053fc11f61ef55e3b405c8551b53ef39e715acd099ae7ecf0c856da3fbe231f78fa7bd4855247680aac56f19e8a725cd79aea33ad40a71db4525aef71e541eaff79fe83b52346f0af98546e6388924e8a3d7153bca935c031c7f2c470a5b924fff005aab2c724f3c8ef966ced03bf1ff00d7a8b96915eea745568e305d9b97763cff008570be25d46e2e2e440c0844e9cf15e836d68b3b48482cdbca9451d31c726b97f15e8c92694d7b1b65d14bb7655cf381ea6b5a328a9ab9351370691e7d24ea0d22b17e9f8d54661b8e056be9b6a5edf791d4d7a52928ab9c508393b11246c6ac4701eb5792c3b8c8fa54e96a579ce6b9e55bb1d31a16dca896beb4ad6bc56ac7129fe1a79b7c9e959fb566fec958e6a78081540e73d79f4aeb26b2054f15837b665096515bd3ab7d0e6ab46daa33c3107fa5481b70350f7fa5387a74ad8e62656c62ba5f095e793ac081a212c730c15ce08239c83eb5cb2372013d2b57489a38b59b3794b8412aee29d719ed5955578b46b4dda48f598add9dbcc898cac9c3237cae4532687ccf2e48d8e31f2890fdd3daaeec2ad14ccde644410b3270c3bf23f0ab09b39867512c4e0bab81d3d7f9d795cc7a373163992693cab854b6bbdc401bbe527d33d8ff003a2b1f5b88d96aac198c9148b9ce7a8ec7ebc0a2b5b36ae8b5494b53b2b8636b69e4c1fbb66f957032c49ef556f5c69b61bdcaa3118453cb335684c9ba581625daa64e646ea4804d72baf5c0bbbd5108322c6700939cfa9fd0fe959a32a70e6958d9d24adc69c92e42292c323966393d2ae59c6a9a7c4ef88d1941383f33679ebfd2b23c23332e9f34263cdc45332364f0a38ea7d339abf6f3116c88adb9e31b0b9e8b8e38fcaa65a306b520b594259904fca6472231d4fcc7ad60eba924fa05c29cfeed0a80067a7b7eb5b512ac72c88d9e4ef553d581eff4ce6a96b56e3fb32ee79b8b792265381fc58e3f0edf9538bf784f6b1e2ab197982f7cd767636de5daa263a0ae7747b7f3b52518e0735d88d91285245776227aa467868593646129ea99e8315326c3dc54e88b9e2b95b3a92444910c74a93cbc0a9d63a718c52b95628ba7cbd2b16f61dc4f15d1b28aa7710a11ce2aa32b326514ce1aea0292645571fad7477d68a41c77ac378183118e476c57753ab7479f52959e8347ca0311f5a9acb7cfa8c091fde691428271ce7de9b72acb046c548cf0411d6aff0085ade3b8f10d947236d432024fa5394bdd6c851f7ac7b840bbbc9e91dc038753d1be534e96dc2cf1bc03cb97761a33d0e476a48c17ba5864386887cb20ee4f41f97f3ab2ede64b0c328db206c861e801e47e95e3dceed8e57c5f6c8d6b14c13648adb5d7ebff00eafd68addf11406e3479a27506518f2dfd483456d07a1db87ab051b4d0be212c34c69598a22b0e07503a56068b14733dc492b144442983cb12c3903e80019f435d3ead12dd58c914c480ea42a0eb9ec4d719a2dd2da5cbda5d8db217c0673850dd3e6fcaa56c72d3f8592682ee9a95fdab3150ccae547563d0feb5ba13ec97651d41f37e644cf0ad8e73f80cfe759979b34bf135bcf14e0b5c44d1c8e701430239fd6b605b25d44de631587a997a127d47a0a527d4728e972392d9a506eb7731f24938f33d57e9fd6abdd4c352b57d880ee46548987dde304b0a985e9959629d400bc44a0604c7d47f51da8bdb79215692ddf17b28c3fa30f43e9ec6a519d8f1fd208b696e6520b383b147a9a75c5ccab29620963cd5ad22c5fcc999d4a95959707d456a3da428373e07b935d929a52b9118b71b239c5d6278ce30ca4fa8adab0d45a6c6e233ec6a1b882ddf24046fa55782258e4cc791ed43e592d8129c5ee75514bbb14d9e7f2c3555b2762326a3bedc4903a1ac12573a2eec579f57f289c81d3359336b8eef8c1dbec2a696dd646fde649a9a0b1819b3b5456cb9518be76ccc370d723073f9d3d22deeab28e4f461deb7574b88818507d2a4fecd423040f518a7ed174054e5d4e7f59b574b58dd8720e0d5bf02c0cfaf2bf91e62a21c92385cf1935a7e21841d1dd88e57157fe1c5bb416f7178ea3ca722327d477a4ea7ee993285aa23d0ed61586216b2316079490f53524199a563372a3e589bd4773f8ff4aaa83ed9fe8f9ff45272b2ff007bd87b7bd68a9511986721760e1ba0c5711a3229dc79d0dbce0152d924f423a7f3228a8e20665945c03ba41fbbcf1f28e9f8f7a2a91ac2116b57623b793edaab2236e91864ff00b1ff00d7accd6744b7b825e184bb85fde60f2deff5ad09a27b095e5b7dc6ddf9b8c0ce3fda1fd6ae8f2ee2d4b40731152430fe2aabd8c69c9a96879ade4e6236c8b234f6b1499f9d30e063054d5fb5d4b78da242b0afe271d81ab3ab691f6895becebf3f561fde358f6d0a993c9955576e7963b4d5d9347d0429d1f65a1d64535bcf0bcf7181b40f2a307057d083fd452dbcb25ba35cdd6e78d864498c951ee3fad72be6491b6d8e6124519e32e0fe55b765abade3470cc42303cee38dc7b0acda3ccaf86e55cd0d51ca6f4852e26180af3c8c39cff11ff0ac0b9d41e7ba11a8da49e659070bf415d3ddc437c8bb40fde39c01c0cb1359335bf046d0456d092bea724a0eda1cc5cddddc33c8af386d8c40e0735a7a7cf24c80b8c38ea2a57b425f2117f119ab36d69b4e154024e49c56d39c5ad8ce9d3927b9b1659294cbde0558b65d89814db98bcc5e2b9afa9d6a3a1cddd48caeaabf79ce05644b3ddc73c8bbd418d882368adebbb424fcc80ed3c13daaa1b58ddb3246a4f724574c24ada9cb56126f4616ba949666313feeddd43068fa73ea2ba3b5be59c2f233df159315ac6dd101e3b8ad2b6b70a47ca07d2b29c93d8d69c6496a4fafae74198f5e9fcc5745e13d21adbc3f6a6e1b304c3718d7a73c827d7e9fceb075742fa2b46a32cce807fdf42baaf0edc5c3d87d846c91914005ce028fc3ad64dfb9609c1dee6f2491451b433baa05e5589c62a34126a0db2e0794b1f28a472fe84fb7b547159156dd348d2dcc5ca3374c7b0ed4fd42f14daacd0303723eea8efeb599114e4ec866a5abc16f68eb3ffc7c2f0aa3a93ebf4a2b989adeeb5299e661348ffc4523271e800a2b4518adcf66951c3d28daabd4ee50ace8361fdd7623f8ab3a7867b695bfb37953cc90f6ff0080fa1a64b1dd58315b1cc911e4c47929f43535bdfc138105b9225232cac30cbeb9a478284b5b8b7bcdd0db82857fd6865dac0fa564788b4d8e588496e804d18cb15ee2b6af2d2ddd10052b38e12443861f8d53db73659571f6943c961c3fe5de84ceac3d5709f3239eb7b47fb26f7726124957519fc08ec6ac8d0a136f9798386e490a0e4d1657315a6a8f0e48b791b281b8dac7dbf4fcab4e5b48e5b80b19319fbc4a7afd3a536756225283d366725710796ed1e49da7193df154de1cf6ad6bf42b772ab1cb073938ebcd533814267345a65216ca0e48a72aae70a3ad2cef814fb44236bbf7e94d94cbd6f6df20a49a02bcd5db72303d29f2a2b8c52b0d48c278d58f23ad406c573951572f2368581ec4d4b6ff0032f340ec538ed403d2ada438c715684231d29e131c526057b8843dbaa9e9e629fc88aded0563b6b499f25ae1a4caa20dcd81f4e99ac2d418c76cbb7a990015d7e93225ada42b2b2a09103649c7349ec67564d474ea4b335c4f12cea3c80bef973ede83f5aa60242328322438e4f24d492dfa9b86f2833c67a63a03f5a8edecdeee412cccd144fc22af5fcea9688d69c553873c8baa534bd8883cd95f9745eb9f5fa5156ed208a381a108011c31ee7de8a8b9c529b93bb28a6a2d684c3790bc73f7623827fa54d2e9f6b71179b20fde7de12a1c303ec6b7cc305f5b059d164523b8ff0038ac7b8f0f4d036fd3ee0800e7ca73c57754c335f09c91aaba99a22d4acdcc9f2de211d18e1d47f5a8e6d521971136f827feeca36febd2ae1bbb9b53b6f6d244c7f128ca9a7836b788777972e7a83ce2b95c5c5ea744676774645ec305ed8b2e06e4fba7b83e955f48f39eddda3b82b347c48928dc0ff5157e7d222cb3599313272006e09ac39e49f4ebb3728e1d64e255c60fe3e94ed747a54daad49c23bf4febcc8750f37ed2cd3050edc9d878ace635b1abbb48f1bb40d17c98c12083f422b164349238232b3b15a6e4f3d3bd3b55d4e2d26d51da2795dce1123a1d378354ee12e9d550ec655fba48e4552b5f5366ee8d5d375759ed96431b44c464a39191519f1204d4e3824b5904321da2604100fb8aa8968d1dbef6c962715249a5c8ca8d1b007af233556408d9d47698d075dc78a82dc152052db412101a77dec06071c0a9bcbdafd2a1a2ee584a7914443e5a791c52b12d906d592544201c9e33eb5d15cda5bc71c6638d4c9804b37271f8d65d8d834f2f9fb9408b9f9866ae7fa4326d33132b1da0051492d4b8c79a57ec5868fedce2188e1106e91bf90ab8f7f68f6e111c3480711c63710476c0a8acb4bb78c345303230f98ee6383f874aba891da4bb5155237e30a3001a52776635aaa93e55b22a24b7b3ed91105b8036b97e5bf2a2a4bbbfb5b29b73c8bf370c80e4fe5452b1809a0ea2593cb2c5915bafa5750a72335c6e971470b2b4c1c80b941d31cff2ae9fedb125b091d80cf0057b4b63ce896c807ad51b8d1ec6e0ee68155bfbc9f29fd2ad4332cd18753c1a79349a4f7293ec61be852c43fd16f5801fc328ddfad64dee85a83991da08a52c304c6d8e3e86bb1cd06b274606d4ebce9bbc59e557493c50fd92e51d6484fc9b8755ff00eb564bae074af45f14e9cb2db1b951f32f5ff3fe7a579fccb8cd7355872b3a675554973a56b900e98a708b3c9e9546e35486ce554955b0dfc40640aab36b114870b28dbe8bcd66a2cd60eece899124b75542a71d79e9566331b0550c0915cbc37eb9ca8948c7f70d595bc6da08867fae3a53e537e5d0ea3cb00714c2bcd645bebb14436dc39007f7855db1d461bf25a2ce3b6454b8b22f62fa0c5388a14539fe54f73c0142425abb13a4b3dac2b8886c65dd9dfd6ae5adbea42e3ed0a96ead20f94484fcbf952db58dedc79722c48c911f9416c0623bd69b26a2147fa2c431d3f7bffd6ab9519f44556af0a51f669abf52a496fa99712bddc51ede0f951e78fc6a57d184cbfe91797137700b617f21536cd525e161b7507fbce4ff002a9a3d3755640ad750201dd1093fad2587a9d8e0f6b1ee456f61691c5fbb8110f4271939fad153a685bdcfda2ea79013c80db41fc28ab5839f727dbc4e7d0dcea0fb5c088c2725bb0a86eafa49f5282212ee891813838dc4547a5a4d334bfbc1e5861be45e4629353bf86ce39eda08d0648c3a8fbd8aecbe871743760f112c4ab6e502638cd6fdadc0b888382083d08ef5e552dc1324657781bbe7c7a015d778799e311619592424a8cf23f0ed445b7b8a337cd63afa4a696da326912559172a723d6acd465c429716f24520caba906bcaf50b7682e248987cc8c54d7ac1e95c7f8b34cfde2dec63e56f964faf6358d68dd5cd29cacce0e4b1498659738a8e3d3238db28a07e15a85769c53d23cd715da3d083ea41145818d8322ae25bf98bd00a41090d9c55b801145cddcdd8ae74c858ee65dc7de882c92de425062b43149b68bdccd8883153dada3df5ec70a038072c4540484e4f6aebbc3d6690d909fac930c93e83d2b7a30bb21d4f64b9fee34eded96085635000031c507cb0e50b8dddc66a5775890bb9c2a8c927b561dfd8457170d7514c5565017744fceeeded5db7b6c79736dea6d46b1190a0605d4648a9b6f1815cb452de69ecc904b1cbbd7081f839f5cf4addb1bb9ae234f361642503163d334295f7262d6c48c190e41e28aa77facc16f2f965646e70cca8768fc68ad149753393b3d0f29b3d62e6da05814b2a8604803a9f526a0bbbd95aea51210ecdfbc66ce4fe1e98a6c326c9195f8841cb211c30edf8d43a923f99b20c330f9f20f2462b956a89356c67171b626761b81dc01f5eb5def87e2644cc858b7ab01cfe55e5fa75c334923637322631cd779e1ed55904704d90a8385239fc0d11693b0e16b9bda9dff95149183fbce9b47e86a7b19a24b68e2560582f38f5ef589a8fef752820323f99331cf2328a3af3f90a95fccb3459e29f36ebf218caf008e3ad5dcd8dab5bc17008e857ae4525eac52db34529f964f96b94b6b990a9daee14e48cd59bcd51e58a38b1b760cb30153ce9a137639cba80c372e879c1c67d6a489015ab178b0fd9d24f332e5b1d3b11c7f5aab13e0e2b866accf4684f9a25a4519e956123155838a9e3938a4745c732628c61734fc83d4d54baba55f910e4d0912ddc8e66dcc147af35df68ff00f209b7c7f72bcf6219f98f5aeeb45b98974a843c8ab8257938e6ba683f78e7c4df952346e03903053cbc1de1c704563f9490dd492406316e14799193f2e7d41f5eb566f35cb6b4bb8edd994efea73c2f38e6b035992fe09d0ed01a650ac21c143d707b107a7e55d52d0f3e4ec5efed282e1d1180dac082643b70bcf7e7d2b4f4e9e596d6431989e255c22464f1ed93d78c735e7df6926530b979589dafd8293ed5d369525cc10988df322e4ed4450cc4f7ce7ebcd6719b6f52233772d2cb736f69242aaab2063f2483851f538c827d3d68abc97f6d791084c87cc2302464e09fe5f8515aee55ae790cacaa164894ca385270476acfd3c976915a5dbb7a02dd055d8e298ed92566584291b8b75cd67cff00678a562adf3704306c86e6b962435a1a76d198a4f349f95b3c2b56d5acf2288ddd082471f3023fcfd2b02d2e238e046c05de788faeee39ff00f556ac1770797184405b07a2e01cfb64e2b395ee248d95ba98ce93924aa2fddeb4f9ef66b89c1276a265b6e7804f7c55459563b5f39d0043e831d07f3e6b223d4669efd16207e6601b3efd0538b7634d8dd5926450a30573c103af155e7bd5889666cb1e307eb57449ba1da4a82bd6a8df430db5934ce804513ef91ba703d3d7d292074dc8935504db0edce091df1fe7f5ac982e997e57c9c77a961173259fdaeeb2ad71f32467f813b7e2724d52c61cd44f73d0a31e58d8d35d422e3e639fa5588f504fe104d73ffc75a16ea4e2a2e74c75469b5cbb8e381512a65b34e038a9a25a2e5587aae055c324efa74b6f039576c1539e9cd40054d1706b48369dccaac54958b9a24714b68d2de4d1cb206daccebdbd0e7f1f6aada858de5cea4737db622fb846a4ed5c0e38fcb3f5e29aeb0c51c8f2394889cc9819c7bd52b99a7b7b836d2c65483947ce77824e083dff00c8ae8755db43cca94dc7466e6816962a2e2d65c998317697ccf95f38e320f6c8fc4d69ae9f058b1b80551631f296c1c927bf1dab857bbb8b6b889ed805853716555caee231923d7deafc1e2a992d8ae033237de3c9e6a9548b32ba5a1dc4325bcc88892c6ed27f740c71d7f0a2b921aac777709711c6b15cee55f94e32bdfe9f5a2af990d4ce4962b76b5dcece18a8da19491ed8ff003dab9d999a2d45218d886501198367be7fad6bea5697d0806462159f0b861f5acefb04be56f8411213c3123922b9e2d152b9a3e4c76b2033bef5033e5919e7b1ce39ab52b44761b7786101864ae490b9e401d2a2104d3a44ed96240509919cfd6b6345f0dddddaab95892107059f0718e3803bd4a4db2522ac9298ec222f2b88d50b0da01dcdf8f6a6691a5dddf4eb770452aa9619623683919cf3d715df41a0d85bed731091d460171903e83a0ab2ca09e3a56d1a7a6a6ae1777663c7a3ac6a0c8e1d87451d01f526b0f5bb6fed0d6ed34dc93676ea2e2e47673fc0a7db835d45dc9e56c45eae7afb560c58226b93f7ee1f793edd147e58a99da2b437a51d4a9aa3ef358ac3e635ab79cd5064ae596a75a4565197ad4b75e2a8c69fbcad288616a0b44a7d2a78ba5571d6ad20c0a6513a8a954629b10e2a5dbc55a2194f527d96720033b94a81eb9e2ba6fecf82e74d8edee5370540bb81c11c7635ce18fed9aa5a5b76dfe637d073fcf15d64a768551eb5d34568d9cb8877691c66ada5cfa37efa3dd3d99e0927be7a35624f141246258984793cee3c0af55b378ee2dcf0195890411d6b9bd6bc0d1cacd71a4b2c1213b9a16fb84fa8f4fa74fa553a5d51c33876390b1f38aacca4b2af19c718a2b493c3d7565a4c9732b797247261d51b2b8e003f9e73f85158f3be865667ffd9', false, 'JAVA', 'PM');


--
-- TOC entry 3221 (class 2606 OID 16434)
-- Name: screen_auth_tb auth_screen_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.screen_auth_tb
    ADD CONSTRAINT auth_screen_tb_pkey PRIMARY KEY (screen_id, auth_group_id);


--
-- TOC entry 3215 (class 2606 OID 16436)
-- Name: auth_group_tb authentication_group_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_tb
    ADD CONSTRAINT authentication_group_tb_pkey PRIMARY KEY (auth_group_id);


--
-- TOC entry 3217 (class 2606 OID 16438)
-- Name: department_tb department_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_tb
    ADD CONSTRAINT department_tb_pkey PRIMARY KEY (department_id);


--
-- TOC entry 3219 (class 2606 OID 49232)
-- Name: member_of_team_tb member_of_team_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_of_team_tb
    ADD CONSTRAINT member_of_team_tb_pkey PRIMARY KEY (member_id);


--
-- TOC entry 3233 (class 2606 OID 41047)
-- Name: position_tb position_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.position_tb
    ADD CONSTRAINT position_tb_pkey PRIMARY KEY (position_id);


--
-- TOC entry 3223 (class 2606 OID 16442)
-- Name: screen_tb screen_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.screen_tb
    ADD CONSTRAINT screen_tb_pkey PRIMARY KEY (screen_id);


--
-- TOC entry 3225 (class 2606 OID 16444)
-- Name: team_tb team_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_tb
    ADD CONSTRAINT team_id_pkey PRIMARY KEY (team_id);


--
-- TOC entry 3227 (class 2606 OID 16446)
-- Name: timesheets_details_tb timesheets_details_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timesheets_details_tb
    ADD CONSTRAINT timesheets_details_tb_pkey PRIMARY KEY (fullname, date);


--
-- TOC entry 3229 (class 2606 OID 16448)
-- Name: timesheets_tb timesheets_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timesheets_tb
    ADD CONSTRAINT timesheets_tb_pkey PRIMARY KEY (username, year, month);


--
-- TOC entry 3231 (class 2606 OID 16450)
-- Name: user_tb user_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tb
    ADD CONSTRAINT user_tb_pkey PRIMARY KEY (username);


--
-- TOC entry 3240 (class 2620 OID 16451)
-- Name: timesheets_details_tb update_time_when_duplicate_fullname_and_date; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_time_when_duplicate_fullname_and_date BEFORE INSERT ON public.timesheets_details_tb FOR EACH ROW EXECUTE FUNCTION public.update_time_when_duplicate_fullname_and_date();


--
-- TOC entry 3241 (class 2620 OID 16452)
-- Name: timesheets_tb update_total_working_hours_and_days_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_total_working_hours_and_days_trigger BEFORE INSERT OR UPDATE ON public.timesheets_tb FOR EACH ROW EXECUTE FUNCTION public.update_total_working_hours_and_days();


--
-- TOC entry 3234 (class 2606 OID 49226)
-- Name: member_of_team_tb member_of_team_tb_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_of_team_tb
    ADD CONSTRAINT member_of_team_tb_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.team_tb(team_id);


--
-- TOC entry 3235 (class 2606 OID 49221)
-- Name: team_tb team_tb_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_tb
    ADD CONSTRAINT team_tb_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department_tb(department_id);


--
-- TOC entry 3236 (class 2606 OID 32876)
-- Name: timesheets_tb timesheets_tb_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timesheets_tb
    ADD CONSTRAINT timesheets_tb_username_fkey FOREIGN KEY (username) REFERENCES public.user_tb(username);


--
-- TOC entry 3237 (class 2606 OID 32856)
-- Name: user_tb user_tb_auth_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tb
    ADD CONSTRAINT user_tb_auth_group_id_fkey FOREIGN KEY (auth_group_id) REFERENCES public.auth_group_tb(auth_group_id);


--
-- TOC entry 3238 (class 2606 OID 49238)
-- Name: user_tb user_tb_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tb
    ADD CONSTRAINT user_tb_position_id_fkey FOREIGN KEY (position_id) REFERENCES public.position_tb(position_id);


--
-- TOC entry 3239 (class 2606 OID 49233)
-- Name: user_tb user_tb_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tb
    ADD CONSTRAINT user_tb_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.team_tb(team_id);


-- Completed on 2023-04-27 11:38:10

--
-- PostgreSQL database dump complete
--

