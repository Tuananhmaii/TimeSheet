--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-04-24 00:52:32

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
    "Descriptons" character varying(100)
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

INSERT INTO public.auth_group_tb VALUES ('Admin', 'Administrator');
INSERT INTO public.auth_group_tb VALUES ('User', 'User');


--
-- TOC entry 3385 (class 0 OID 16404)
-- Dependencies: 215
-- Data for Name: department_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.department_tb VALUES ('MKT', 'Marketing', 'Phòng marketing');
INSERT INTO public.department_tb VALUES ('BOD', 'Director', 'Phòng giám đốc');
INSERT INTO public.department_tb VALUES ('DEV', 'Development', 'Phòng phát triển');
INSERT INTO public.department_tb VALUES ('PRODUCT', 'Production', 'Phòng sản xuất');
INSERT INTO public.department_tb VALUES ('ACCOUNT', 'Accounting', 'Phòng kế toán');
INSERT INTO public.department_tb VALUES ('HR', 'Human Resource', 'Phòng nhân sự');


--
-- TOC entry 3386 (class 0 OID 16407)
-- Dependencies: 216
-- Data for Name: member_of_team_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.member_of_team_tb VALUES ('NET', 'ThanhDD', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('BOD', 'ThaoLS', 'BOD');
INSERT INTO public.member_of_team_tb VALUES ('JAVA', 'ThienLTH', 'PM');
INSERT INTO public.member_of_team_tb VALUES ('JAVA', 'ChuongLV', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('HR', 'VyTTH', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('NET', 'DatTC', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('Comtor', 'SangLT', 'PM');
INSERT INTO public.member_of_team_tb VALUES ('PHP', 'TrungNT', 'PM');
INSERT INTO public.member_of_team_tb VALUES ('PHP', 'HungTH', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('PHP', 'HoanTV', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('PHP', 'HaiNV', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('JAVA', 'DungLV', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('React', 'DatNT', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('JAVA', 'HiepPD', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('PHP', 'HaiN', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('JAVA', 'HaoH', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('JAVA', 'HoangL', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('JAVA', 'TuanLQ', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('React', 'QuangNM', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('React', 'ThanhDT', 'Member');
INSERT INTO public.member_of_team_tb VALUES ('React', 'LuanND', 'Member');


--
-- TOC entry 3394 (class 0 OID 41041)
-- Dependencies: 224
-- Data for Name: position_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.position_tb VALUES ('Leader', 'PM');
INSERT INTO public.position_tb VALUES ('Member
', 'Mem');


--
-- TOC entry 3387 (class 0 OID 16410)
-- Dependencies: 217
-- Data for Name: screen_auth_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.screen_auth_tb VALUES ('Admin', 'frmLogin', '1');
INSERT INTO public.screen_auth_tb VALUES ('Admin', 'frmMenu', '1');
INSERT INTO public.screen_auth_tb VALUES ('Admin', 'frmPersonalInfo', '1');
INSERT INTO public.screen_auth_tb VALUES ('Admin', 'frmEmployeeList', '1');
INSERT INTO public.screen_auth_tb VALUES ('Admin', 'frmPersonalTimesheets', '1');
INSERT INTO public.screen_auth_tb VALUES ('Admin', 'frmTimesheets', '1');
INSERT INTO public.screen_auth_tb VALUES ('Admin', 'tsmi_Logout', '1');
INSERT INTO public.screen_auth_tb VALUES ('Admin', 'frmPersonalTimesheet', '1');


--
-- TOC entry 3388 (class 0 OID 16413)
-- Dependencies: 218
-- Data for Name: screen_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.screen_tb VALUES ('frmLogin', 'Màn hình đăng nhập');
INSERT INTO public.screen_tb VALUES ('frmMenu', 'Màn hình Menu');
INSERT INTO public.screen_tb VALUES ('frmEmpoloyeeList', 'Màn hình danh sách nhân viên');


--
-- TOC entry 3389 (class 0 OID 16416)
-- Dependencies: 219
-- Data for Name: team_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.team_tb VALUES ('Comtor', 'DEV Development', 'DEV');
INSERT INTO public.team_tb VALUES ('HR', 'Human Resource', 'HR');
INSERT INTO public.team_tb VALUES ('JAVA', 'Java Development', 'DEV');
INSERT INTO public.team_tb VALUES ('NET', 'NET Development', 'DEV');
INSERT INTO public.team_tb VALUES ('BOD', 'Director team', 'BOD');
INSERT INTO public.team_tb VALUES ('PHP', 'PHP Development', 'DEV');
INSERT INTO public.team_tb VALUES ('React', 'REACT Development', 'DEV');
INSERT INTO public.team_tb VALUES ('Tester', 'TESTER Development', 'DEV');


--
-- TOC entry 3390 (class 0 OID 16419)
-- Dependencies: 220
-- Data for Name: timesheets_details_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2022-11-29', '2022-11-29 13:30:24', '2022-11-29 16:42:00', 3.2);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Long', '2022-11-28', '2022-11-28 07:59:20', '2022-11-28 13:30:05', 5.5);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2022-11-25', '2022-11-25 17:02:38', '2022-11-25 17:02:38', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2022-11-27', '2022-11-27 14:01:35', '2022-11-27 14:01:35', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2022-11-29', '2022-11-29 10:30:30', '2022-11-29 17:04:33', 6.6);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-28', '2022-11-28 11:31:26', '2022-11-28 13:24:45', 1.9);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2022-11-29', '2022-11-29 08:04:35', '2022-11-29 15:40:23', 7.6);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2022-11-29', '2022-11-29 09:04:35', '2022-11-29 16:03:59', 7.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2022-11-28', '2022-11-28 07:45:22', '2022-11-28 16:48:22', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Long', '2022-11-29', '2022-11-29 07:56:11', '2022-11-29 15:17:22', 7.4);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2022-11-30', '2022-11-30 11:23:23', '2022-11-30 14:58:46', 3.6);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2022-11-27', '2022-11-27 17:11:37', '2022-11-27 17:41:45', 0.5);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2022-11-30', '2022-11-30 08:26:23', '2022-11-30 13:01:27', 4.6);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2022-11-30', '2022-11-30 10:40:13', '2022-11-30 14:04:41', 3.4);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-30', '2022-11-30 10:25:12', '2022-11-30 14:46:19', 4.4);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2022-11-30', '2022-11-30 08:06:10', '2022-11-30 08:06:10', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2022-11-30', '2022-11-30 07:53:49', '2022-11-30 13:19:02', 5.4);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2022-11-29', '2022-11-29 07:50:34', '2022-11-29 14:39:08', 6.8);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2022-11-28', '2022-11-28 08:02:57', '2022-11-28 13:00:38', 5.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2022-11-25', '2022-11-25 16:55:51', '2022-11-25 16:55:51', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2022-11-21', '2022-11-21 16:25:49', '2022-11-21 16:26:03', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2022-11-21', '2022-11-21 07:58:20', '2022-11-21 10:51:01', 2.9);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2022-11-28', '2022-11-28 07:54:02', '2022-11-28 13:10:28', 5.3);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2022-11-24', '2022-11-24 09:37:39', '2022-11-24 09:37:39', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2022-11-26', '2022-11-26 17:46:29', '2022-11-26 17:46:46', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'CẢNH BÁO!', '2022-11-25', '2022-11-25 16:53:04', '2022-11-25 16:53:04', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-26', '2022-11-26 09:11:05', '2022-11-26 14:23:04', 5.2);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-29', '2022-11-29 11:41:09', '2022-11-29 17:16:28', 5.6);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2022-11-29', '2022-11-29 07:09:43', '2022-11-29 07:09:43', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2022-11-30', '2022-11-30 12:23:21', '2022-11-30 12:23:21', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2022-11-23', '2022-11-23 13:09:14', '2022-11-23 13:09:26', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2022-11-28', '2022-11-28 12:37:53', '2022-11-28 12:37:53', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-20', '2022-11-20 08:08:58', '2022-11-20 08:08:58', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2022-11-30', '2022-11-30 13:38:22', '2022-11-30 13:38:22', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2022-11-29', '2022-11-29 08:36:49', '2022-11-29 09:48:54', 1.2);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2022-11-25', '2022-11-25 08:12:20', '2022-11-25 15:28:19', 7.3);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2022-11-29', '2022-11-29 07:54:42', '2022-11-29 13:07:31', 5.2);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2022-11-25', '2022-11-25 11:52:02', '2022-11-25 11:52:02', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2022-11-30', '2022-11-30 07:49:58', '2022-11-30 14:40:42', 6.8);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2022-11-28', '2022-11-28 07:52:40', '2022-11-28 14:09:11', 6.3);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2022-11-28', '2022-11-28 11:46:40', '2022-11-28 13:40:13', 1.9);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2022-11-24', '2022-11-24 13:24:48', '2022-11-24 13:24:48', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2022-11-25', '2022-11-25 17:00:11', '2022-11-25 17:00:11', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2022-11-29', '2022-11-29 12:52:27', '2022-11-29 15:42:12', 2.8);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Huỳnh Quốc Trung', '2022-11-25', '2022-11-25 17:35:15', '2022-11-25 17:35:47', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2022-11-25', '2022-11-25 16:55:18', '2022-11-25 17:03:14', 0.1);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2022-11-28', '2022-11-28 08:03:06', '2022-11-28 16:02:29', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'CẢNH BÁO!', '2022-11-28', '2022-11-28 07:52:57', '2022-11-28 07:52:57', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2022-11-29', '2022-11-29 07:52:56', '2022-11-29 14:46:20', 6.9);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2022-11-28', '2022-11-28 07:48:51', '2022-11-28 14:56:11', 7.1);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2022-11-25', '2022-11-25 16:55:15', '2022-11-25 16:55:15', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2022-11-28', '2022-11-28 12:37:08', '2022-11-28 20:44:58', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2022-11-30', '2022-11-30 07:44:25', '2022-11-30 07:44:25', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47363565944846', '2022-11-30', '2022-11-30 15:24:38', '2022-11-30 15:24:38', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2022-11-29', '2022-11-29 07:58:55', '2022-11-29 13:06:57', 5.1);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Long', '2022-11-30', '2022-11-30 12:23:00', '2022-11-30 12:23:00', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-14', '2023-03-14 08:05:46', '2023-03-14 08:05:46', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-06', '2023-03-06 07:26:50', '2023-03-06 07:26:50', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-21', '2023-03-21 08:10:36', '2023-03-21 08:10:36', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-07', '2023-03-07 07:57:48', '2023-03-07 17:03:24', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-16', '2023-03-16 08:04:53', '2023-03-16 12:02:12', 4.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-13', '2023-03-13 07:53:43', '2023-03-13 17:11:13', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-21', '2023-03-21 07:52:43', '2023-03-21 17:28:20', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-10', '2023-03-10 17:12:48', '2023-03-10 17:12:48', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-20', '2023-03-20 09:30:47', '2023-03-20 18:56:39', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-20', '2023-03-20 07:52:10', '2023-03-20 17:03:37', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-09', '2023-03-09 08:14:20', '2023-03-09 17:08:16', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-31', '2023-03-31 08:02:43', '2023-03-31 17:00:34', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-21', '2023-03-21 07:58:12', '2023-03-21 17:02:17', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-07', '2023-03-07 07:59:56', '2023-03-07 17:16:48', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-02', '2023-03-02 08:00:14', '2023-03-02 08:00:14', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-10', '2023-03-10 07:52:31', '2023-03-10 14:32:46', 6.7);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-10', '2023-03-10 08:01:23', '2023-03-10 17:07:54', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-28', '2023-03-28 07:53:04', '2023-03-28 17:18:13', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-09', '2023-03-09 08:00:40', '2023-03-09 17:06:59', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-31', '2023-03-31 07:59:42', '2023-03-31 17:08:12', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-30', '2023-03-30 08:10:12', '2023-03-30 17:46:28', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-27', '2023-03-27 08:09:25', '2023-03-27 17:11:47', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-31', '2023-03-31 07:49:20', '2023-03-31 17:08:21', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-17', '2023-03-17 08:08:34', '2023-03-17 17:02:46', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-09', '2023-03-09 08:28:02', '2023-03-09 17:18:51', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-22', '2023-03-22 07:57:22', '2023-03-22 17:24:29', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-09', '2023-03-09 07:44:08', '2023-03-09 17:08:33', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-03', '2023-03-03 09:52:23', '2023-03-03 17:37:01', 7.7);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-06', '2023-03-06 07:49:11', '2023-03-06 17:17:27', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-17', '2023-03-17 07:57:14', '2023-03-17 16:59:10', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-24', '2023-03-24 07:51:16', '2023-03-24 17:07:16', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-01', '2023-03-01 09:11:29', '2023-03-01 17:23:01', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-21', '2023-03-21 07:59:19', '2023-03-21 19:02:53', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'CẢNH BÁO!', '2023-03-02', '2023-03-02 17:11:23', '2023-03-02 17:11:23', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-28', '2023-03-28 07:53:02', '2023-03-28 17:11:51', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-16', '2023-03-16 07:24:49', '2023-03-16 17:10:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-13', '2023-03-13 07:58:24', '2023-03-13 17:03:28', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-28', '2023-03-28 07:43:51', '2023-03-28 17:06:37', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-02', '2023-03-02 07:58:04', '2023-03-02 17:11:02', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-15', '2023-03-15 07:26:45', '2023-03-15 17:07:59', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-20', '2023-03-20 07:53:46', '2023-03-20 07:53:46', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-31', '2023-03-31 08:13:45', '2023-03-31 17:03:40', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-17', '2023-03-17 07:54:59', '2023-03-17 17:02:29', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-16', '2023-03-16 07:40:32', '2023-03-16 17:07:01', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-17', '2023-03-17 07:37:03', '2023-03-17 17:01:34', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-28', '2023-03-28 17:15:12', '2023-03-28 17:15:12', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-22', '2023-03-22 07:47:01', '2023-03-22 17:06:00', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-23', '2023-03-23 08:09:35', '2023-03-23 17:34:46', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-15', '2023-03-15 08:01:58', '2023-03-15 17:07:14', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-15', '2023-03-15 08:03:50', '2023-03-15 08:03:50', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-09', '2023-03-09 07:48:35', '2023-03-09 12:02:53', 4.2);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-20', '2023-03-20 07:52:05', '2023-03-20 17:07:13', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-13', '2023-03-13 08:00:37', '2023-03-13 17:16:19', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-16', '2023-03-16 08:03:54', '2023-03-16 17:10:52', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-16', '2023-03-16 08:17:03', '2023-03-16 17:33:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-21', '2023-03-21 08:18:37', '2023-03-21 17:40:24', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-21', '2023-03-21 07:26:10', '2023-03-21 17:33:04', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-06', '2023-03-06 08:14:12', '2023-03-06 17:38:49', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-01', '2023-03-01 08:00:39', '2023-03-01 16:07:17', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-24', '2023-03-24 07:36:37', '2023-03-24 07:36:37', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-24', '2023-03-24 07:59:17', '2023-03-24 07:59:17', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-08', '2023-03-08 07:36:07', '2023-03-08 17:16:33', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-10', '2023-03-10 07:50:23', '2023-03-10 17:08:44', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-07', '2023-03-07 07:55:16', '2023-03-07 17:04:55', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-16', '2023-03-16 07:59:26', '2023-03-16 17:07:06', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-31', '2023-03-31 07:32:24', '2023-03-31 17:18:13', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-20', '2023-03-20 07:55:35', '2023-03-20 17:06:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-16', '2023-03-16 08:14:18', '2023-03-16 19:19:08', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-15', '2023-03-15 08:03:47', '2023-03-15 18:25:46', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-03', '2023-03-03 07:39:38', '2023-03-03 17:39:52', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-03', '2023-03-03 08:14:10', '2023-03-03 08:14:10', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47911887175708', '2023-03-13', '2023-03-13 12:53:52', '2023-03-13 12:53:52', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-14', '2023-03-14 09:27:39', '2023-03-14 17:33:49', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-17', '2023-03-17 07:47:47', '2023-03-17 17:33:21', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-20', '2023-03-20 07:53:53', '2023-03-20 17:09:07', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-29', '2023-03-29 08:02:55', '2023-03-29 17:11:46', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-16', '2023-03-16 07:59:19', '2023-03-16 17:05:11', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-03', '2023-03-03 17:39:45', '2023-03-03 17:39:45', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-21', '2023-03-21 08:00:34', '2023-03-21 17:13:41', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-29', '2023-03-29 07:47:19', '2023-03-29 13:10:36', 5.4);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-24', '2023-03-24 08:00:36', '2023-03-24 17:39:16', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-03', '2023-03-03 07:48:25', '2023-03-03 17:33:23', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-02', '2023-03-02 08:10:49', '2023-03-02 17:10:37', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-28', '2023-03-28 07:45:15', '2023-03-28 17:06:50', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-09', '2023-03-09 08:12:45', '2023-03-09 17:08:27', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-09', '2023-03-09 07:57:08', '2023-03-09 17:05:30', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-17', '2023-03-17 07:58:00', '2023-03-17 17:33:50', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47911887175708', '2023-03-14', '2023-03-14 14:43:37', '2023-03-14 14:43:37', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2023-03-13', '2023-03-13 12:45:15', '2023-03-13 12:45:15', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-27', '2023-03-27 07:57:48', '2023-03-27 17:32:38', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-23', '2023-03-23 08:09:31', '2023-03-23 17:15:45', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-30', '2023-03-30 08:04:21', '2023-03-30 08:04:21', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-03', '2023-03-03 07:46:22', '2023-03-03 17:34:17', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-09', '2023-03-09 07:57:02', '2023-03-09 17:02:12', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-15', '2023-03-15 08:18:26', '2023-03-15 18:25:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-22', '2023-03-22 08:17:16', '2023-03-22 17:41:07', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-23', '2023-03-23 08:00:03', '2023-03-23 08:00:03', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-07', '2023-03-07 12:42:58', '2023-03-07 12:42:58', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-02', '2023-03-02 07:44:00', '2023-03-02 17:10:32', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-02', '2023-03-02 07:47:07', '2023-03-02 17:10:34', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-27', '2023-03-27 07:32:25', '2023-03-27 17:05:07', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-01', '2023-03-01 07:55:01', '2023-03-01 07:55:01', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-03', '2023-03-03 14:38:07', '2023-03-03 14:38:07', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-03', '2023-03-03 08:02:38', '2023-03-03 15:12:57', 7.2);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-17', '2023-03-17 07:57:09', '2023-03-17 17:02:49', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-06', '2023-03-06 08:00:32', '2023-03-06 17:18:54', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-02', '2023-03-02 07:38:32', '2023-03-02 17:10:22', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'CẢNH BÁO!', '2023-03-08', '2023-03-08 15:55:28', '2023-03-08 15:55:28', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-22', '2023-03-22 07:59:07', '2023-03-22 17:08:50', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-06', '2023-03-06 07:53:28', '2023-03-06 17:07:23', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-06', '2023-03-06 08:18:37', '2023-03-06 19:18:27', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-01', '2023-03-01 07:55:05', '2023-03-01 17:14:52', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-22', '2023-03-22 07:54:08', '2023-03-22 17:40:59', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-17', '2023-03-17 07:28:20', '2023-03-17 17:04:08', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-14', '2023-03-14 07:51:55', '2023-03-14 07:51:55', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-29', '2023-03-29 07:41:27', '2023-03-29 17:38:44', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-08', '2023-03-08 17:12:45', '2023-03-08 17:12:45', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-21', '2023-03-21 08:09:10', '2023-03-21 08:09:10', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-03', '2023-03-03 08:04:39', '2023-03-03 17:34:20', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-08', '2023-03-08 07:52:46', '2023-03-08 17:14:58', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-28', '2023-03-28 17:14:13', '2023-03-28 17:14:13', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-22', '2023-03-22 07:54:05', '2023-03-22 17:08:43', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-27', '2023-03-27 08:01:38', '2023-03-27 17:08:41', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-15', '2023-03-15 07:56:18', '2023-03-15 17:05:30', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-14', '2023-03-14 07:29:52', '2023-03-14 17:22:19', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-08', '2023-03-08 07:48:56', '2023-03-08 17:02:40', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-16', '2023-03-16 07:44:39', '2023-03-16 17:05:16', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-27', '2023-03-27 11:08:39', '2023-03-27 11:08:39', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2023-03-27', '2023-03-27 07:54:21', '2023-03-27 07:54:21', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-23', '2023-03-23 17:10:22', '2023-03-23 17:10:22', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-09', '2023-03-09 07:55:46', '2023-03-09 07:55:46', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-08', '2023-03-08 17:13:03', '2023-03-08 17:13:03', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-30', '2023-03-30 08:03:23', '2023-03-30 17:12:29', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-03', '2023-03-03 08:04:35', '2023-03-03 17:34:14', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-09', '2023-03-09 08:01:34', '2023-03-09 17:07:17', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-01', '2023-03-01 07:39:08', '2023-03-01 17:13:22', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-01', '2023-03-01 09:12:22', '2023-03-01 17:22:58', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-24', '2023-03-24 08:01:33', '2023-03-24 08:01:33', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-15', '2023-03-15 07:54:04', '2023-03-15 17:07:10', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-14', '2023-03-14 07:56:58', '2023-03-14 07:56:58', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-23', '2023-03-23 07:43:34', '2023-03-23 17:06:14', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-31', '2023-03-31 07:42:16', '2023-03-31 07:42:16', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-10', '2023-03-10 07:55:54', '2023-03-10 19:04:31', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-02', '2023-03-02 07:45:29', '2023-03-02 17:12:23', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-10', '2023-03-10 08:05:06', '2023-03-10 08:05:06', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-22', '2023-03-22 07:27:46', '2023-03-22 17:08:32', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-20', '2023-03-20 07:10:40', '2023-03-20 17:07:04', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-20', '2023-03-20 08:09:31', '2023-03-20 18:14:26', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-02', '2023-03-02 08:34:38', '2023-03-02 08:34:38', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-21', '2023-03-21 07:49:44', '2023-03-21 07:49:44', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-13', '2023-03-13 07:48:26', '2023-03-13 17:03:32', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-14', '2023-03-14 08:00:27', '2023-03-14 08:00:27', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-09', '2023-03-09 07:59:24', '2023-03-09 17:18:25', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-21', '2023-03-21 07:54:31', '2023-03-21 17:09:38', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-03', '2023-03-03 07:53:52', '2023-03-03 17:39:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-27', '2023-03-27 08:09:34', '2023-03-27 08:09:34', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-09', '2023-03-09 08:16:10', '2023-03-09 17:12:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-14', '2023-03-14 07:59:49', '2023-03-14 17:24:16', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-09', '2023-03-09 08:15:52', '2023-03-09 08:15:52', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-14', '2023-03-14 08:13:51', '2023-03-14 17:32:17', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-31', '2023-03-31 08:02:11', '2023-03-31 08:02:11', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-28', '2023-03-28 08:04:28', '2023-03-28 08:04:28', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-02', '2023-03-02 11:35:01', '2023-03-02 11:35:01', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-14', '2023-03-14 07:55:46', '2023-03-14 17:06:09', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-06', '2023-03-06 07:42:42', '2023-03-06 17:38:37', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-23', '2023-03-23 07:52:18', '2023-03-23 17:43:40', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-06', '2023-03-06 08:04:14', '2023-03-06 17:17:23', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-07', '2023-03-07 08:19:48', '2023-03-07 18:47:53', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-16', '2023-03-16 07:57:16', '2023-03-16 17:49:24', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-14', '2023-03-14 07:57:35', '2023-03-14 17:10:38', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-03', '2023-03-03 07:49:42', '2023-03-03 17:43:48', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-15', '2023-03-15 07:45:35', '2023-03-15 17:27:59', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-08', '2023-03-08 08:04:52', '2023-03-08 17:19:10', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-22', '2023-03-22 07:31:28', '2023-03-22 17:40:47', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-10', '2023-03-10 07:47:15', '2023-03-10 17:08:48', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-30', '2023-03-30 07:47:50', '2023-03-30 17:48:04', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-23', '2023-03-23 07:25:40', '2023-03-23 17:44:11', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-07', '2023-03-07 08:03:13', '2023-03-07 08:03:13', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-29', '2023-03-29 08:26:56', '2023-03-29 17:38:11', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-13', '2023-03-13 10:18:47', '2023-03-13 17:11:18', 6.9);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-13', '2023-03-13 08:08:32', '2023-03-13 17:36:10', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-21', '2023-03-21 08:00:29', '2023-03-21 17:16:53', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-27', '2023-03-27 08:05:45', '2023-03-27 19:02:26', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-15', '2023-03-15 07:44:14', '2023-03-15 17:03:07', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'CẢNH BÁO!', '2023-03-30', '2023-03-30 17:11:42', '2023-03-30 17:11:42', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-29', '2023-03-29 08:00:16', '2023-03-29 17:39:33', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-13', '2023-03-13 07:56:17', '2023-03-13 17:36:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-20', '2023-03-20 08:00:58', '2023-03-20 17:25:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-15', '2023-03-15 08:14:04', '2023-03-15 17:07:41', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-07', '2023-03-07 15:59:56', '2023-03-07 17:07:10', 1.1);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-16', '2023-03-16 08:01:40', '2023-03-16 17:07:08', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-16', '2023-03-16 07:59:22', '2023-03-16 17:10:45', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-27', '2023-03-27 08:21:53', '2023-03-27 17:36:00', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-23', '2023-03-23 07:41:12', '2023-03-23 07:41:12', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-21', '2023-03-21 07:57:58', '2023-03-21 17:04:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-08', '2023-03-08 07:59:32', '2023-03-08 17:05:47', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-08', '2023-03-08 15:10:17', '2023-03-08 15:10:17', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-30', '2023-03-30 08:19:33', '2023-03-30 17:34:00', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-10', '2023-03-10 07:53:50', '2023-03-10 17:03:20', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-09', '2023-03-09 07:55:44', '2023-03-09 17:08:44', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2023-03-07', '2023-03-07 07:51:21', '2023-03-07 07:51:21', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-07', '2023-03-07 17:12:12', '2023-03-07 17:12:12', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-27', '2023-03-27 08:07:37', '2023-03-27 17:32:35', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-27', '2023-03-27 08:15:24', '2023-03-27 08:15:24', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-22', '2023-03-22 07:42:06', '2023-03-22 17:41:09', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-13', '2023-03-13 08:00:54', '2023-03-13 08:00:54', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-24', '2023-03-24 08:34:01', '2023-03-24 17:40:25', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-22', '2023-03-22 07:48:32', '2023-03-22 17:07:46', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-20', '2023-03-20 08:00:44', '2023-03-20 08:00:44', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-21', '2023-03-21 07:56:47', '2023-03-21 07:56:47', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-30', '2023-03-30 07:27:45', '2023-03-30 17:10:17', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-29', '2023-03-29 08:11:08', '2023-03-29 17:07:24', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-29', '2023-03-29 07:35:41', '2023-03-29 17:07:22', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-13', '2023-03-13 08:46:32', '2023-03-13 17:29:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-24', '2023-03-24 07:49:51', '2023-03-24 07:49:51', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-01', '2023-03-01 17:22:35', '2023-03-01 17:22:35', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-08', '2023-03-08 07:37:28', '2023-03-08 15:52:40', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-23', '2023-03-23 07:36:43', '2023-03-23 16:04:36', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-16', '2023-03-16 07:55:31', '2023-03-16 17:03:09', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-14', '2023-03-14 07:38:47', '2023-03-14 07:38:47', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-07', '2023-03-07 08:00:43', '2023-03-07 11:53:20', 3.9);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-16', '2023-03-16 07:47:27', '2023-03-16 17:05:19', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-17', '2023-03-17 08:01:14', '2023-03-17 17:03:50', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-27', '2023-03-27 07:59:33', '2023-03-27 17:02:27', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-08', '2023-03-08 08:23:40', '2023-03-08 08:23:40', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-29', '2023-03-29 08:14:29', '2023-03-29 17:28:55', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-13', '2023-03-13 10:41:54', '2023-03-13 10:41:54', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-03', '2023-03-03 08:00:23', '2023-03-03 17:33:27', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-02', '2023-03-02 07:58:08', '2023-03-02 16:14:07', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-08', '2023-03-08 18:01:02', '2023-03-08 18:01:02', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-23', '2023-03-23 07:59:42', '2023-03-23 17:14:15', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-15', '2023-03-15 07:55:52', '2023-03-15 07:55:52', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-07', '2023-03-07 07:48:58', '2023-03-07 17:18:05', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-21', '2023-03-21 07:54:28', '2023-03-21 17:16:44', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-14', '2023-03-14 08:12:08', '2023-03-14 08:12:08', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-24', '2023-03-24 08:08:34', '2023-03-24 18:12:02', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-24', '2023-03-24 08:03:43', '2023-03-24 17:08:27', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-14', '2023-03-14 08:08:36', '2023-03-14 17:10:33', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-27', '2023-03-27 08:04:06', '2023-03-27 17:11:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-15', '2023-03-15 08:03:44', '2023-03-15 08:03:44', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-10', '2023-03-10 07:59:20', '2023-03-10 07:59:20', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-30', '2023-03-30 07:56:22', '2023-03-30 17:34:20', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-02', '2023-03-02 07:53:58', '2023-03-02 17:11:10', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-30', '2023-03-30 07:40:29', '2023-03-30 17:22:16', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-06', '2023-03-06 07:53:31', '2023-03-06 17:17:21', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-02', '2023-03-02 08:19:49', '2023-03-02 08:19:49', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-24', '2023-03-24 08:06:25', '2023-03-24 08:06:25', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-17', '2023-03-17 08:10:21', '2023-03-17 17:34:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-08', '2023-03-08 07:44:36', '2023-03-08 17:17:38', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-15', '2023-03-15 07:50:53', '2023-03-15 15:55:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-14', '2023-03-14 07:49:53', '2023-03-14 17:12:01', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-23', '2023-03-23 07:53:24', '2023-03-23 17:19:07', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-31', '2023-03-31 07:57:22', '2023-03-31 17:03:52', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-13', '2023-03-13 07:54:21', '2023-03-13 17:38:40', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-07', '2023-03-07 07:51:26', '2023-03-07 17:37:02', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-17', '2023-03-17 07:51:04', '2023-03-17 17:03:39', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-13', '2023-03-13 07:51:30', '2023-03-13 17:29:21', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-02', '2023-03-02 07:55:55', '2023-03-02 17:06:17', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-20', '2023-03-20 07:49:06', '2023-03-20 17:07:00', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-07', '2023-03-07 08:00:00', '2023-03-07 17:18:54', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-13', '2023-03-13 08:36:49', '2023-03-13 17:59:56', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-23', '2023-03-23 07:55:09', '2023-03-23 17:01:07', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-08', '2023-03-08 07:52:48', '2023-03-08 07:52:48', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-24', '2023-03-24 08:06:27', '2023-03-24 17:01:32', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-30', '2023-03-30 07:59:06', '2023-03-30 13:54:58', 5.9);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-24', '2023-03-24 07:54:56', '2023-03-24 17:04:01', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-23', '2023-03-23 07:56:59', '2023-03-23 17:10:25', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-23', '2023-03-23 08:12:27', '2023-03-23 19:11:51', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-09', '2023-03-09 07:53:57', '2023-03-09 17:08:10', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-02', '2023-03-02 07:45:22', '2023-03-02 17:10:49', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-23', '2023-03-23 08:12:12', '2023-03-23 18:02:08', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-28', '2023-03-28 17:06:32', '2023-03-28 17:06:32', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-31', '2023-03-31 07:59:55', '2023-03-31 17:08:16', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-21', '2023-03-21 08:10:42', '2023-03-21 17:51:01', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-27', '2023-03-27 07:47:41', '2023-03-27 07:47:41', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-23', '2023-03-23 08:27:47', '2023-03-23 18:01:52', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-02', '2023-03-02 15:37:44', '2023-03-02 17:10:52', 1.6);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-16', '2023-03-16 07:59:35', '2023-03-16 17:11:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-03', '2023-03-03 07:52:28', '2023-03-03 17:39:35', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-22', '2023-03-22 08:02:55', '2023-03-22 08:02:55', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-01', '2023-03-01 08:09:23', '2023-03-01 17:25:13', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-14', '2023-03-14 07:21:37', '2023-03-14 17:25:12', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-17', '2023-03-17 07:57:20', '2023-03-17 17:03:10', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-07', '2023-03-07 07:53:05', '2023-03-07 17:17:29', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-06', '2023-03-06 08:00:54', '2023-03-06 08:00:54', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-20', '2023-03-20 07:19:33', '2023-03-20 17:06:38', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-17', '2023-03-17 08:01:02', '2023-03-17 17:04:29', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47911887175708', '2023-03-08', '2023-03-08 14:27:02', '2023-03-08 14:27:02', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-07', '2023-03-07 07:49:30', '2023-03-07 17:23:06', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-27', '2023-03-27 08:15:19', '2023-03-27 08:15:19', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-28', '2023-03-28 07:51:29', '2023-03-28 17:07:48', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-22', '2023-03-22 07:57:19', '2023-03-22 15:54:52', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-13', '2023-03-13 08:36:40', '2023-03-13 17:58:47', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-16', '2023-03-16 07:59:30', '2023-03-16 17:15:49', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-30', '2023-03-30 07:51:29', '2023-03-30 17:19:38', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-27', '2023-03-27 07:57:51', '2023-03-27 17:11:37', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-10', '2023-03-10 07:55:29', '2023-03-10 17:08:54', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-22', '2023-03-22 07:55:46', '2023-03-22 17:08:53', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-01', '2023-03-01 07:46:08', '2023-03-01 17:23:06', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-17', '2023-03-17 08:07:42', '2023-03-17 08:07:42', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-14', '2023-03-14 08:01:45', '2023-03-14 17:00:59', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-29', '2023-03-29 07:58:04', '2023-03-29 17:39:36', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2023-03-08', '2023-03-08 15:13:10', '2023-03-08 15:19:15', 0.1);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-16', '2023-03-16 07:57:20', '2023-03-16 17:02:58', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-30', '2023-03-30 07:59:12', '2023-03-30 17:17:21', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-09', '2023-03-09 08:05:04', '2023-03-09 17:05:40', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-03', '2023-03-03 07:49:32', '2023-03-03 17:34:01', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-28', '2023-03-28 07:46:40', '2023-03-28 17:07:39', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-06', '2023-03-06 08:05:31', '2023-03-06 08:05:31', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-07', '2023-03-07 07:47:37', '2023-03-07 17:12:20', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-08', '2023-03-08 07:38:54', '2023-03-08 17:04:28', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-07', '2023-03-07 08:02:04', '2023-03-07 17:22:31', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-13', '2023-03-13 07:56:40', '2023-03-13 07:56:40', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-01', '2023-03-01 08:05:07', '2023-03-01 17:13:27', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-01', '2023-03-01 08:09:25', '2023-03-01 08:09:25', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-14', '2023-03-14 07:51:15', '2023-03-14 17:14:04', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-16', '2023-03-16 17:33:31', '2023-03-16 17:33:31', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-10', '2023-03-10 08:06:18', '2023-03-10 08:06:18', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-28', '2023-03-28 08:34:10', '2023-03-28 08:34:10', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-22', '2023-03-22 08:31:45', '2023-03-22 18:40:23', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-24', '2023-03-24 08:01:40', '2023-03-24 17:18:28', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-14', '2023-03-14 07:43:38', '2023-03-14 17:32:12', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-09', '2023-03-09 08:14:49', '2023-03-09 17:18:55', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-09', '2023-03-09 08:01:31', '2023-03-09 17:02:45', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-29', '2023-03-29 07:58:07', '2023-03-29 17:22:48', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-30', '2023-03-30 07:56:27', '2023-03-30 17:17:24', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-30', '2023-03-30 07:59:14', '2023-03-30 16:54:14', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-13', '2023-03-13 07:37:39', '2023-03-13 17:58:21', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-09', '2023-03-09 07:27:08', '2023-03-09 17:05:22', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-29', '2023-03-29 07:58:18', '2023-03-29 17:39:22', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-16', '2023-03-16 07:47:36', '2023-03-16 17:11:08', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-29', '2023-03-29 08:05:09', '2023-03-29 17:39:29', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-23', '2023-03-23 07:49:28', '2023-03-23 17:03:29', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-15', '2023-03-15 07:59:43', '2023-03-15 17:07:47', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-24', '2023-03-24 07:51:21', '2023-03-24 07:51:21', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Chương', '2023-03-10', '2023-03-10 09:48:16', '2023-03-10 18:09:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-10', '2023-03-10 07:59:22', '2023-03-10 17:12:43', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-07', '2023-03-07 07:57:43', '2023-03-07 17:18:01', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-24', '2023-03-24 08:14:52', '2023-03-24 08:14:52', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-15', '2023-03-15 07:39:19', '2023-03-15 17:06:37', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-13', '2023-03-13 07:33:24', '2023-03-13 17:15:22', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47911887175708', '2023-03-03', '2023-03-03 07:42:42', '2023-03-03 10:03:31', 2.3);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-01', '2023-03-01 07:57:03', '2023-03-01 17:22:23', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-20', '2023-03-20 08:19:51', '2023-03-20 11:25:27', 3.1);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-02', '2023-03-02 07:32:26', '2023-03-02 17:10:45', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Thị Sang', '2023-03-29', '2023-03-29 08:00:20', '2023-03-29 17:11:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-15', '2023-03-15 13:06:09', '2023-03-15 17:06:16', 4.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-10', '2023-03-10 07:55:56', '2023-03-10 07:55:56', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-15', '2023-03-15 07:47:52', '2023-03-15 17:19:47', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-08', '2023-03-08 07:45:26', '2023-03-08 17:17:40', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-08', '2023-03-08 17:02:18', '2023-03-08 17:02:18', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-22', '2023-03-22 14:42:28', '2023-03-22 17:09:26', 2.4);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Thành Đạt', '2023-03-20', '2023-03-20 08:01:00', '2023-03-20 17:08:15', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2023-03-09', '2023-03-09 08:10:14', '2023-03-09 08:10:14', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Thị Hiền Vy', '2023-03-10', '2023-03-10 07:50:28', '2023-03-10 17:08:36', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-06', '2023-03-06 07:58:51', '2023-03-06 17:17:32', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-28', '2023-03-28 07:31:26', '2023-03-28 17:07:32', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-31', '2023-03-31 07:59:53', '2023-03-31 17:07:59', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-20', '2023-03-20 08:09:24', '2023-03-20 17:21:28', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-13', '2023-03-13 12:31:31', '2023-03-13 12:31:31', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-17', '2023-03-17 07:51:00', '2023-03-17 17:02:32', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-21', '2023-03-21 07:12:12', '2023-03-21 07:12:12', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-22', '2023-03-22 07:48:26', '2023-03-22 17:05:13', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-31', '2023-03-31 07:57:26', '2023-03-31 07:57:26', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Đình Luân', '2023-03-21', '2023-03-21 15:20:56', '2023-03-21 17:50:06', 2.5);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2023-03-22', '2023-03-22 07:42:00', '2023-03-22 16:39:57', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-02', '2023-03-02 17:11:06', '2023-03-02 17:11:06', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47911887175708', '2023-03-06', '2023-03-06 07:55:06', '2023-03-06 07:55:06', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-01', '2023-03-01 09:10:19', '2023-03-01 17:22:44', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-02', '2023-03-02 08:03:43', '2023-03-02 08:03:43', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Văn Hoàn', '2023-03-24', '2023-03-24 08:01:38', '2023-03-24 17:02:41', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-16', '2023-03-16 08:16:59', '2023-03-16 17:30:45', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Văn Dũng', '2023-03-06', '2023-03-06 07:50:31', '2023-03-06 17:16:02', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-23', '2023-03-23 07:59:53', '2023-03-23 07:59:53', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-08', '2023-03-08 07:59:36', '2023-03-08 07:59:36', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Hoàng-intern', '2023-03-10', '2023-03-10 07:53:56', '2023-03-10 17:03:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-17', '2023-03-17 08:10:19', '2023-03-17 08:10:19', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Văn Hải', '2023-03-06', '2023-03-06 07:40:31', '2023-03-06 17:15:55', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2023-03-14', '2023-03-14 16:13:03', '2023-03-14 16:13:03', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-24', '2023-03-24 07:39:59', '2023-03-24 17:01:08', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-17', '2023-03-17 07:53:10', '2023-03-17 17:10:34', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-28', '2023-03-28 08:30:31', '2023-03-28 17:15:26', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phạm Văn Quân', '2023-03-03', '2023-03-03 08:02:17', '2023-03-03 14:25:46', 6.4);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Thân Công Đạt', '2023-03-30', '2023-03-30 08:01:18', '2023-03-30 17:12:19', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-14', '2023-03-14 07:54:07', '2023-03-14 17:03:18', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Sỹ Thao', '2023-03-10', '2023-03-10 12:44:16', '2023-03-10 12:44:16', 0.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-22', '2023-03-22 08:09:09', '2023-03-22 17:46:51', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Đường Đức Thanh', '2023-03-10', '2023-03-10 07:27:14', '2023-03-10 17:08:10', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Quốc Tuấn', '2023-03-21', '2023-03-21 07:40:24', '2023-03-21 17:03:30', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, '47396050173971', '2023-03-15', '2023-03-15 08:02:02', '2023-03-15 17:27:55', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Phan Đình Hiệp', '2023-03-07', '2023-03-07 08:23:04', '2023-03-07 17:37:04', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Nguyễn Minh Quang', '2023-03-22', '2023-03-22 07:55:27', '2023-03-22 17:18:50', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Hoàng Hảo', '2023-03-23', '2023-03-23 07:56:22', '2023-03-23 17:42:42', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Trần Hữu Hùng', '2023-03-24', '2023-03-24 08:01:36', '2023-03-24 17:07:20', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Ngô Thành Trung', '2023-03-20', '2023-03-20 07:53:50', '2023-03-20 17:57:19', 8.0);
INSERT INTO public.timesheets_details_tb VALUES (NULL, 'Lê Trương Huỳnh Thiên', '2023-03-01', '2023-03-01 07:56:53', '2023-03-01 16:10:06', 8.0);


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

INSERT INTO public.timesheets_tb VALUES ('HaoH', 'Hoàng Hảo', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, 1.9, 7.0, 5.4, NULL, 3.0, 14.3);
INSERT INTO public.timesheets_tb VALUES ('ThaoLS', 'Lê Sỹ Thao', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.9, NULL, 0.0, 0.0, 0.0, 0.0, 0.5, NULL, 6.9, 4.6, NULL, 4.0, 14.9);
INSERT INTO public.timesheets_tb VALUES ('SangLT', 'Lê Thị Sang', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, 8.0, 6.6, 6.8, NULL, 3.0, 21.4);
INSERT INTO public.timesheets_tb VALUES ('DungLV', 'Lê Văn Dũng', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8.0, 6.8, 0.0, NULL, 2.0, 14.8);
INSERT INTO public.timesheets_tb VALUES ('TrungNT', 'Ngô Thành Trung', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, 7.3, NULL, 0.0, 6.3, 1.2, 0.0, NULL, 3.0, 14.8);
INSERT INTO public.timesheets_tb VALUES ('LuanND', 'Nguyễn Đình Luân', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3.2, NULL, NULL, 1.0, 3.2);
INSERT INTO public.timesheets_tb VALUES ('HaiNV', 'Nguyễn Văn Hải', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, 7.1, 5.2, 0.0, NULL, 2.0, 12.3);
INSERT INTO public.timesheets_tb VALUES ('HiepPD', 'Phan Đình Hiệp', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, 8.0, 5.1, 3.4, NULL, 3.0, 16.5);
INSERT INTO public.timesheets_tb VALUES ('HungTH', 'Trần Hữu Hùng', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.1, NULL, NULL, 0.0, 7.6, 3.6, NULL, 3.0, 11.3);
INSERT INTO public.timesheets_tb VALUES ('VyTTH', 'Trần Thị Hiền Vy', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, 0.0, NULL, 5.2, NULL, 1.9, 5.6, 4.4, NULL, 4.0, 17.1);
INSERT INTO public.timesheets_tb VALUES ('HoanTV', 'Trần Văn Hoàn', 2022, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5.3, 0.0, NULL, 3.0, 2.0, 8.3);
INSERT INTO public.timesheets_tb VALUES ('DatTC', 'Thân Công Đạt', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 0.0, 8.0, 8.0, NULL, NULL, 8.0, 0.0, 8.0, 8.0, 0.0, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 8.0, 18.0, 144.0);
INSERT INTO public.timesheets_tb VALUES ('QuangNM', 'Nguyễn Minh Quang', 2023, 3, 8.0, 0.0, 7.2, NULL, NULL, 8.0, 8.0, 0.0, 8.0, 8.0, NULL, NULL, 0.0, 8.0, 8.0, 0.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, 19.0, 151.2);
INSERT INTO public.timesheets_tb VALUES ('TuanLQ', 'Lê Quốc Tuấn', 2023, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7.0, 56.0);
INSERT INTO public.timesheets_tb VALUES ('HiepPD', 'Phan Đình Hiệp', 2023, 3, 0.0, 0.0, 0.0, NULL, NULL, 8.0, 8.0, NULL, 8.0, 0.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, NULL, NULL, 3.1, 8.0, 8.0, 8.0, 0.0, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 0.0, 14.0, 107.1);
INSERT INTO public.timesheets_tb VALUES ('HaiNV', 'Nguyễn Văn Hải', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 0.0, 8.0, 8.0, 8.0, NULL, NULL, NULL, 0.0, 8.0, 0.0, 0.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, 17.0, 136.0);
INSERT INTO public.timesheets_tb VALUES ('ThaoLS', 'Lê Sỹ Thao', 2023, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.1, 0.0, 0.0, NULL, NULL, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8.0, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, 2.0, 8.1);
INSERT INTO public.timesheets_tb VALUES ('ThienLTH', 'Lê Trương Huỳnh Thiên', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, NULL, NULL, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 5.4, 8.0, 8.0, 20.0, 157.4);
INSERT INTO public.timesheets_tb VALUES ('LuanND', 'Nguyễn Đình Luân', 2023, 3, 0.0, 0.0, NULL, NULL, NULL, NULL, 0.0, 0.0, 8.0, 0.0, NULL, NULL, 0.0, NULL, NULL, 8.0, NULL, NULL, NULL, 8.0, 2.5, 8.0, 8.0, 8.0, NULL, NULL, 0.0, 0.0, 8.0, 8.0, 8.0, 10.0, 74.5);
INSERT INTO public.timesheets_tb VALUES ('ThanhDD', 'Đường Đức Thanh', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, 23.0, 184.0);
INSERT INTO public.timesheets_tb VALUES ('DungLV', 'Lê Văn Dũng', 2023, 3, 0.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 4.2, NULL, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16.0, 124.2);
INSERT INTO public.timesheets_tb VALUES ('DatNT', 'Nguyễn Thành Đạt', 2023, 3, NULL, NULL, NULL, NULL, NULL, NULL, 1.1, 0.0, 8.0, 8.0, NULL, NULL, 8.0, 0.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 0.0, 0.0, NULL, NULL, 8.0, NULL, NULL, NULL, NULL, 11.0, 81.1);
INSERT INTO public.timesheets_tb VALUES ('VyTTH', 'Trần Thị Hiền Vy', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, NULL, 8.0, 0.0, 8.0, 8.0, NULL, NULL, 6.9, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, 21.0, 166.9);
INSERT INTO public.timesheets_tb VALUES ('HaoH', 'Hoàng Hảo', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 0.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17.0, 136.0);
INSERT INTO public.timesheets_tb VALUES ('SangLT', 'Lê Thị Sang', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 0.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, NULL, NULL, 8.0, 0.0, 8.0, 8.0, 8.0, 20.0, 160.0);
INSERT INTO public.timesheets_tb VALUES ('ChuongLV', 'Lê Văn Chương', 2023, 3, NULL, 0.0, 0.0, NULL, NULL, 8.0, 8.0, 0.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 0.0, NULL, 8.0, 8.0, NULL, NULL, 0.0, 0.0, 8.0, 8.0, NULL, 14.0, 112.0);
INSERT INTO public.timesheets_tb VALUES ('HungTH', 'Trần Hữu Hùng', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 0.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, NULL, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 0.0, 8.0, NULL, NULL, 8.0, NULL, NULL, 8.0, 8.0, 18.0, 144.0);
INSERT INTO public.timesheets_tb VALUES ('TrungNT', 'Ngô Thành Trung', 2023, 3, NULL, 1.6, 0.0, NULL, NULL, NULL, 0.0, 0.0, 8.0, NULL, NULL, NULL, 8.0, 0.0, 0.0, 8.0, NULL, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, NULL, NULL, 8.0, 0.0, 8.0, 5.9, NULL, 11.0, 79.5);
INSERT INTO public.timesheets_tb VALUES ('HoanTV', 'Trần Văn Hoàn', 2023, 3, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 6.7, NULL, NULL, NULL, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 8.0, NULL, NULL, 8.0, 8.0, 8.0, 8.0, 0.0, 21.0, 166.7);


--
-- TOC entry 3393 (class 0 OID 16428)
-- Dependencies: 223
-- Data for Name: user_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_tb VALUES ('ThaoLS', '1962026656160185351301320480154111117132155', 'Lê Sỹ Thao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('ThienLTH', '1962026656160185351301320480154111117132155', 'Lê Trương Huỳnh Thiên', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('ChuongLV', '1962026656160185351301320480154111117132155', 'Lê Văn Chương', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('VyTTH', '1962026656160185351301320480154111117132155', 'Trần Thị Hiền Vy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('DatTC', '1962026656160185351301320480154111117132155', 'Thân Công Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('SangLT', '1962026656160185351301320480154111117132155', 'Lê Thị Sang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('TrungNT', '1962026656160185351301320480154111117132155', 'Ngô Thành Trung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('HungTH', '1962026656160185351301320480154111117132155', 'Trần Hữu Hùng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('HoanTV', '1962026656160185351301320480154111117132155', 'Trần Văn Hoàn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('HaiNV', '1962026656160185351301320480154111117132155', 'Nguyễn Văn Hải', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('DungLV', '1962026656160185351301320480154111117132155', 'Lê Văn Dũng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('DatNT', '1962026656160185351301320480154111117132155', 'Nguyễn Thành Đạt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('HiepPD', '1962026656160185351301320480154111117132155', 'Phan Đình Hiệp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('HaiN', '1962026656160185351301320480154111117132155', 'Nguyễn Hải', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('HaoH', '1962026656160185351301320480154111117132155', 'Hoàng Hảo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('HoangL', '1962026656160185351301320480154111117132155', 'Lê Hoàng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('TuanLQ', '1962026656160185351301320480154111117132155', 'Lê Quốc Tuấn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('QuangNM', '1962026656160185351301320480154111117132155', 'Nguyễn Minh Quang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('ThanhDT', '1962026656160185351301320480154111117132155', 'Đỗ Tấn Thành', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('LuanND', '1962026656160185351301320480154111117132155', 'Nguyễn Đình Luân', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.user_tb VALUES ('vitrannhat1', '1', 'Trần Nhật Vĩ', '2001-08-10', 'vitrannhat1@gmail.com', '0919562182', 'An Khe, Thanh Khe', 'Kinh', 'Lương', '233316603', 'None', 'None', '2023-04-16', 'None', 'Admin', NULL, true, 'NET', 'PM');
INSERT INTO public.user_tb VALUES ('ThanhDD', 'c30f02adc000b565f761a2b292b37169', 'Đường Đức Thanh', '1997-05-01', 'thanhdd@golineglobal.vn', '0379113210', 'Ngũ Hành Sơn, Đà Nẵng', 'Kinh', 'Không', '1842720757', '550000', 'None', '2023-11-18', 'None', 'Admin', '\xffd8ffe000104a46494600010101006000600000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc000110800cf00a803012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00a34514568677034d34ee28e2905c652538d25301b9a39a5a290c6d18a5cd19a00514b4dcd28a00753945329c1b1486482908a4df485a980a1f14be667bd479a4a0097752123d6a2cd19a0090b0a2a2cd14ec0499a29b45048bf8d18a4cd19a005c518a4dd46ea401494668cd30133499a0d308e6818b406c5368e6900ff33da8df51d1cd0325df47982a2e68c5004be60a6efa8f14b8a007eea4dd49462801734518a281684b451b8526fa648b4534bd34b80324e28b00fa4cd377526f049008c8eb45807e68a6668c9a2c171c69a68c9a4a0028a28a06145145001451451600a28a4a2c3168cd25145807668a6d145804694632c40f5ac5d4b5d58814b723703824ff004a5d6ae8c763b5480ce71c9e95c7bb8073bb7106b39c9ec893b3b6d76dda302562180ebd7351df5d1bb2b1c3284561dfd735c8a4c3cd500719fd2b552e9e46f35db72a301807a75a5ccdab32a28e874e9da369219ee04840ca9f6a48a5b7b5bdbd9cca332153b777a0ed5813bacb2298ce09e01078a6befc066f9811c639a7ced685729badaf43e6719da7a035520d6cc52c8d23ef5200503b62b969ae5fed1827e51c0a8da639c83d6ab50b23b74f11db1386571ea6b4edeea2ba4df0b061df1dabcd84dc8e79ec6afe9baac963742446c29e187634ee271477fcfa51f37a5523a8b18c4995552073f5a77db641d7157633b96f268c9f4aad16a09245e61381f4a78bd52b951bbf2a02e4f9a6eff9f6fb566dc6a4a1b31c8a7d633c11f4aa89a993333ee271ebd16b37357b1491bfba9375661d44a421823b13d370c6efa535f578a33890306039155cd10b3dcd5dd46eac78b5b824b9f2feeae3af5a59756459d510fca0fcc7d68e688accd7dd45535bb46191d0f4a2aac17399d46f14c4c0485d08e846067d456204793a71efdab49bca2bb4c3d4f03279ab16d6698df2011a0ed5cb146b28bbea56b4b16fbc461472cc6ac3f971dc2220237ae1b19e79ef4b777bbf6c500c2afa7155006ddbcb316f5cd50d1a6903c70925595bd3d79aab35cbcacd1c64b3639dbfa8a5b68eef519becf033907ef1cf00575fa7e8d6da7db79610348c30ee47268486d9e6d736b26e8c104b326ec0f7aae639231928c00f515dc4da13c73285668d149c903a8cf1d6a59ec20b888c4ca0823a9a9f6b6d0d9524d5ce0038f4a41364e0fe75da47a54500558507272cddf15c7ddaefbd9951707cd2001f5ab8cf9999ce9f2ab9d0d9dd4af628aec4a7503e9560896440eb9d8381cd4115b9b426daf0344f1afcb91d7e9481e44563971e8076a86993cb7356d60596d5d5e605c8f9573c0f7359f2c9344993fbb0bc7cadcd54f3a6049dedcf5e2810cf213f26ec7a9e6972c84e247248ce721d0b0fef718a7c33f96e4890360f4c646698f6131e4c440a04691065c72286ac4599b097b25c27992cca880e3685001ac4babacc8dc8714edc48ed8f42688d9a26ca6cc91dc034729a59b4410dc6e6f4ed9c54f1c92eeddf3151e82832c85587c9b4f5000a3cc751f2b0fc2aac0a26e468ad088848bcf5c75fce8ac413cd820485477c363345689c6daa138be85d5896d70d3e493d17b9a64f2b5c3742a9fdd06877795f7312cc7b9a8ddd22c67927d0d40c30a0760075a96cf4fb8d4e4d90ae23cfccc4702ade95a349a8913cdf25be781ddabafb7852de248e24558d78005313196161069b6a22887d58f526ad7ddf9d8671c9028543b81231e952e06306a845696f21932369acdbb4429fb98c0e72c7353b2ec6742000a706b3752bff002615890f2c7b77159cb6d4da1be8432677ec56382307deb9bb6b30be308e398011093cc62dd3039ae86d8b160cc3ad3752b04b98fcc042baf39f51e959c25666b523cd137af6c2d758b3c07563fc1229ce0d7157969716571e4dc290c3ee91d187b569595e3d9ac92413058d7b30c6f6a9aeb58fed0b630dde9e1c0e43c6fcafb8e2b768e64ec65471a5b9f3262378e8be94f86f4924c614e7fbdc566cd2e5b018b73c134897120fdd9c920f19ea0fb54d98eeba9b0f35c14219630a473592e8ff006d556e10fa1ef5ab6d722e63d85955d7ae4629b2a47c2961c038239c54bf31349947cb3f682263b1738dc549c569af87e59143a4c8ca464100e0d10dc2bef8ee02eec6381f7eafe978b26959598c4e01543d055213724b4288f0dcf8ff005abff7c9a078727e9e62ff00df26afdcf885a07dab62d2fa157ffeb5407c406600f90d1e472bbf38a1d9117a8563e1bb8c1fde29ff00809a2ad378859446be501ee1bad153cc877a861eef35b628273fc23d6b674cd0093e7de0f9474407afd6b434cd023b1884b3f331e83d2b69157601c919e9deb4b1571d0855882aaaede9c0a9a38c0e692388803353629a44dc4c52d1838e6a39ae21b689a49a45445ea49a6056beb2372bba393649efd0fd6b8ed46eed4ea08b11dd2479476ddf78fd2ae6a9afcf7e1a1b426080e4173c337f80ae1e78dada75951bbe41fc4ff85449268d20da677513f0a4fe759fabde910b4715c6c9146e3b5b915ceb6b97662f2d1953dd47350a0536be63b132492639ea7d4d4c69d9dd9a4aa5d5916edae4bed96ea479020dc413c7b56dd9859e2f95c2b0f9ddbdfb0acb64b51004e3fbcdf41daa68a175f2dd98a42797f726b54626b436b657776d3a9c36cde547f3a65fe97e702de59661c028304554b3b8823b8568d9d0420a17edeb5d44445cac5207077ae7d4e69340710e93da00cc38070245e83d8d5d8af926daac36bf4233c37f856cdcd94925d1c2a2c6ff0078f5c9f7ac5bcd21a17c46363ff70fdd6fa7a544a2a4b5111fdf7dc1d01cf635692574651f215ef87cfe98ac76528ec8c8524f7ebffd7a9a27118dc4866078ed50f9907333485d6d28b9c8e7248aa7264ef745241e07b502605f0c8a14f19f4a79251b00f1f5ed52e571dee4024e416edda8a5704e640b91e8beb453b5c67a67f1b6ec1cf000a91630393f7ab9df0c6ab36a17376f72e37e5762f61d7815d264e735ba258e3d2976e39a6313c5326793c97f2f0640a7683eb4c467eabae5be9c0c60f9b718e2353d3ea7b5725757d717d2f9972d9c1f9403c2fd07f5a2e616133f9c0acc492e1877355d97038e0773517b96886e1642ea919c2ac658fe3589722510c664ee303f3ad2267334ee872a63383f4005675e1736d00718da0d53d816e5655dcc00ee6ae08e37bf58f77eed0e3f2aaa98da5bd07eb5a31582a2c5217fbca58fb0ce2988b12c31ee8c6eff0058debd87356a1be492cf6b0241703247b8aa5141fe970876f976b37d38a7d9496ed6b2a360157c83f88a405e8ae615b8ba84a7c8c99ce3daba0d0e6531346b86118047e2a2b07fd185c88c7f1a30cd68e8ef15ade471b9c890000fbe38a6c0d59df3298fcbc63a1cf150fd93cc99263c9006013c7ff5aa4ba426e083212c573eded4cb5f9177b48570c01a91199a9e9325c2a6d43b8162413c8f706b9e9609ad462542548cee0391f515deacb6f24a56493395c2e463150dde9ab34cdb8fdd5f90f4cfd7da80386876b21da3207cc475a97e69c2ba0ed82055db8d39ed666206c04852c0641f4a4891a2bc5b7661963c3a8c8ace51b6a161b6b04922e065540ebfaff4a2b49254cec1c823919e09c7b5159b958ad0ada0de7d9b58c0fbb26d24febfd2bbf59e274f3165429fdeddc579ad8ac916a36d2843856c12471c1ef5d05cfd910b04ba5c93d0499fd2b74c25b9d23df5a8ff009788ff0006cd67ddeb705b94d87cc2cd86ea303d6b9b7b8b45e0b973ec2ab497111e12224938a2e2b17f52ba17f34f2c4c3118c29f518aa292aa15598719ea06452444b40d2c687695f98014b2aab4793c0200cfd685a819724f22f9caabd13f4e2a64dd7216df672c0293e83bd57493ca9678c2b15002824fbd5e86ee05bc5ce437007e7552d816e64cc9e779088154360600c7d7f955ab98e68a58e35048109e298b0cb35ecb2ff754bf5e84f4ab0676fb7b2b8ce23c525b0d99cd2cac88e73b42e0e3d2b42282c0da4255db2ed865cd52497cd8c2ed223070e7db356da0b551132390cec085eca2a8469b4314b7a02e06d8ce31da9e9fbb58989f9e16573ee00aae6ddbed2d344d9c459c5354c93deaa1257112eefaf1401d55dc90070430dc00c29f7aa0660ccd348cb1c4bc7d6abc2b1280ce19881ce5aa0be9237427cade40e0124ff2acdb1a4529ef6696ecc90cbb107f0b74abf6daec9147e5dcc6c40e8e87a555582d655e51e163cf1c8fc8f3fad2ff00664adcc4e920f44386fc8d2b95645ad4afa3bfb78d6294123923a1fc7d6b2a433add40f1abe08e5bde9b2c6cafb1e33bba90460d4d03394d9f3ec5e71449e82712f5b4681de591c6fc03b48cede3b1a2a33e6bdab03801811b81c28a2b07abd49d4a5b8613218e54e79ef4d2c4a2e147cd1e3af7f5a9080b1e3f895b38e8714e7daac01030ad9ebd8d6f735b109dcc081d59411b7d453b241ddd4060ff005f5a1b28464e551ba7d7ff00d748bb7003b1187db8c7407fc8a00916792159c5bbe029dc030ce41f6aad35cdc9816dd369f30f2defe8076a961e2e23539c1cc6c3f955a78a28ed428931327ce78c13571337b997a71105ccb1ccbf30201fcea7711bcd3f95b77e060639a2d1924be904cc189c307fef0e29922086799a3e49703f0a6221592e218279304fef029fc291af47dad9e44232b8a896ea448991978601ff005ab90b4535f2f98a1576e32c38a2c171b67ff1ea41402362c771ee6afdce9eb71750084f00648cd11dba5d446c6370a8a776ef5cf6a8e34b9b5be96419f2d06dce78a6036179ed6f2e15b2516320e6ac3a09eee1955b6f453f95578f504977ef5f9e66c0a9af5404fddb721fe503d05033abb18608ed9018919f9cb6dce79ab81d7181181ff01ac4b4d55e1b089648d3701cb335325f10a27fcbc429feef358bdcbb1b1258db5c9f9a300fa818aa92e84aa098ae08f66158b2f8957b4d3c9fee2e3fc2952f9ae7908e7dc9cd1b058b13a4d6ea56668a68d7b310dffd71562dec347f296696598bb8cb22f45f6ac8b8be8632d149bb71182a055c54996d8483604081873ce3152e496e3b1aff006ad3510a25b3b8230777714573fa65ccb7b74b1c80246549c83cd159caa460ec5a89414676ef24875da08f5a7e43f1b4169131c1c722b7fcbd06dc0fddbca474c9269dfdb1650e05bd820c7425456d724c0104f391b6176dc9fc2a4f22ad0d16fa6248b771bc67e62060d6849afddb644691a0fa5675ceb37ae306e187d0e2810b3e9b35844659bcbfbe19554e49602a19236bb963b98c349363e644ec3deb3c5dca662e4991d465431ef5d6e9302d9d9a4640dec32c7d4d372e5438d3e77a9c8dadbac7a95c46c48080919ea3bd387fa34971c17249c6074adc6d0db52d43ed01fca8886491bb9e7b56a1b5b1b0b793cb8c6eda73231c9fad1ed103a4f739a86da38d91ee061d63198d793f4f6a8e210c0543aab3b9deec4f0bed52a6a36f14d2a428598f5c77ac9265b8710b0d910e3dcd68636342f6ea00a56c082e7ef15e82aa477f298fc8909d83976f5aa92916c7cb8c8c13c9ab1f688e74581622140c93eb40c922685e5f311773818451dbdcd5a16f346a2e01de085fc39e6b3add258eca691171938e95b569348b1c51b0cacaa474e871c500655d42de648cff007802715158279930dd8c152791915afa830997cd0bb498b91ef835534c50258c900fcbdeb19697357ac492fc298d02a2aab38e9d0d5cb142232abce0e48aaf762331a95209f3403818156ed5095660718f7c7eb597d933fb255be0ad7ff30c7ca3f9d6ac9246d66a9d311f2319acd9089ef3763180a3f5abe7625ab393f314c1c7d38a535a229fc28a5a7e5590aae4e0d1496ec5154819e39e28a9a8aec99bd459258c05cb1e46463bd432ddac71ef0a5b8c819ab7068b753a4676851d32e7f2a9ef74116ba54b3bca1a44600a81c75ffebd74688d55d98f1dd4b3c857605041ef9a96385e7cec8d9fe4c9c0ce2ace851c6da9a09555902924357525ede142d0a0f9093f22f6a570b6973ceaea2922bff986d65c647a576b1b04219989c37f915cc6b6de66ad33818dd820568a5cc96f6d0b09d5cb46188ee0e3bd13d4ba6d266d0bbc068f2430e485e8b595aaddf9368fbbb8e99aaf1dca4568d73349d3e63ee7d2b26599b535f3e4256312615734a31bb1ce69210ddc51c8ad027cce391e9f5355aee5134a36f2c7e52c3bd5c916dd0dc0001da0638e9c547ba355b6c2724835d16392e436f68e5e5cc65b68cd3ad9d6d9527d8701be607b8abb15d18efa401060a8ef423c373a7481a300ab7269d809e29362cca1330483229d1dea8fb13004a96c67d38a866956ce38648c86524123d455b8120843c720c47b84b19f4a4036ee4596190a8fba1d7fcfe755f4d45768d5f3829d8d59b84416b23a1ca9dc33faff008555b060a532db7298cd633ea6cbe1259a3805bee467de661f216e00fa54a2e0420a96c06ebc6692fade389d6441feb581c83dc123f5e2a48feeb1dc323a02327f0acfa10be12383265249cf4e7f1a9f7a80f193d63ce2a3880f39b1e83b54781e64ae70491b47cbe9434125eea1616da80919e304514c4fba872010463345292d49a9b9d425d84b64dd347186504e4fb0aced52fa29aca58d647766c738e3ad360b24f2d5b68c900d4774b1be9b33a6700953c7a1c542ac9bb2475383b5db33f4e91e2bc568d559b0786e95ad2497d2a3069b6a907e54181599a48cea083fd93fcab7fca3e6e771dbb71b7b67d6955a9252b263841357671f780f9c09249d8bc9fa5743636886c61257ef2026b02f39953feb9aff002aeaac3fe41d6fff005cd7f9515dbe5414d6ace675c8bfd212d2dd0e000cf8e833d2abdb5937f67ee638024071f9558d46ee24d764de0b2b601fa8a49013692081cb29018f6c63ff00d55d94d5a08e59bbc9929b2884f36e39ca67ad318db082db1b770205396de57bb0c5b868fd6a2364bfd9e0ef398db3c7d6ac92790c02fc723e64f4a6db4b6ca6e6ddf1839edd2a6f2e2fb55bb3ae72319a0d95ac97f22ab152ca0d1a0092adba698ad90cb8001fc6a769a091eda293015d7071e98eb515a69cb3594d68ec72ac483529d355e0b57dc7720daa7f0ffeb50035ed961d2e5457dc632ca4fad50b543218d1464ed15b5a1c25aff6cca2488c8fb95b9078adbb9d06d9f371648619829c05202b7b63b561565676368c5b81cc5ff48c6470e000011c7f9350caec311c6bb99bdf1c714978cff6cd8ea3208208f7a782bf680bbb6c9b4ec38ef52be1216b11f68b20771202ac3d7eb5248a36871bbe507a9e3918a7468d1cf22b8f99546466a3692496d95e41b554951839c81d3f5a4eef629a6d24889503a00481819c9ed455ad362865982cfbbcbd993b4027f5a29b439534f53fffd9', false, 'JAVA', 'PM');


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


-- Completed on 2023-04-24 00:52:32

--
-- PostgreSQL database dump complete
--

