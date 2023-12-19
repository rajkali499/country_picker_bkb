import 'package:flutter/cupertino.dart';

import 'model/country_model.dart';

const noneName = "None";

final noneCountry = CountryModel(name: noneName);
final noneState = StateModel(name: noneName);
final noneCity = CityModel(name: noneName);

final emptyCountry = CountryModel();
final emptyState = StateModel();
final emptyCity = CityModel();

const jsonPath = 'country_details_minified.json';

var flags = {
  "AD": "packages/country_picker_bkb/lib/assets/svg/ad.svg",
  "AE": "packages/country_picker_bkb/lib/assets/svg/ae.svg",
  "AF": "packages/country_picker_bkb/lib/assets/svg/af.svg",
  "AG": "packages/country_picker_bkb/lib/assets/svg/ag.svg",
  "AI": "packages/country_picker_bkb/lib/assets/svg/ai.svg",
  "AL": "packages/country_picker_bkb/lib/assets/svg/al.svg",
  "AM": "packages/country_picker_bkb/lib/assets/svg/am.svg",
  "AO": "packages/country_picker_bkb/lib/assets/svg/ao.svg",
  "AQ": "packages/country_picker_bkb/lib/assets/svg/aq.svg",
  "AR": "packages/country_picker_bkb/lib/assets/svg/ar.svg",
  "AS": "packages/country_picker_bkb/lib/assets/svg/as.svg",
  "AT": "packages/country_picker_bkb/lib/assets/svg/at.svg",
  "AU": "packages/country_picker_bkb/lib/assets/svg/au.svg",
  "AW": "packages/country_picker_bkb/lib/assets/svg/aw.svg",
  "AX": "packages/country_picker_bkb/lib/assets/svg/ax.svg",
  "AZ": "packages/country_picker_bkb/lib/assets/svg/az.svg",
  "BA": "packages/country_picker_bkb/lib/assets/svg/ba.svg",
  "BB": "packages/country_picker_bkb/lib/assets/svg/bb.svg",
  "BD": "packages/country_picker_bkb/lib/assets/svg/bd.svg",
  "BE": "packages/country_picker_bkb/lib/assets/svg/be.svg",
  "BF": "packages/country_picker_bkb/lib/assets/svg/bf.svg",
  "BG": "packages/country_picker_bkb/lib/assets/svg/bg.svg",
  "BH": "packages/country_picker_bkb/lib/assets/svg/bh.svg",
  "BI": "packages/country_picker_bkb/lib/assets/svg/bi.svg",
  "BJ": "packages/country_picker_bkb/lib/assets/svg/bj.svg",
  "BL": "packages/country_picker_bkb/lib/assets/svg/bl.svg",
  "BM": "packages/country_picker_bkb/lib/assets/svg/bi.svg",
  "BN": "packages/country_picker_bkb/lib/assets/svg/bn.svg",
  "BO": "packages/country_picker_bkb/lib/assets/svg/bo.svg",
  "BQ": "packages/country_picker_bkb/lib/assets/svg/bq.svg",
  "BR": "packages/country_picker_bkb/lib/assets/svg/br.svg",
  "BS": "packages/country_picker_bkb/lib/assets/svg/bs.svg",
  "BT": "packages/country_picker_bkb/lib/assets/svg/bt.svg",
  "BV": "packages/country_picker_bkb/lib/assets/svg/bv.svg",
  "BW": "packages/country_picker_bkb/lib/assets/svg/bw.svg",
  "BY": "packages/country_picker_bkb/lib/assets/svg/by.svg",
  "BZ": "packages/country_picker_bkb/lib/assets/svg/bz.svg",
  "CA": "packages/country_picker_bkb/lib/assets/svg/ca.svg",
  "CC": "packages/country_picker_bkb/lib/assets/svg/cc.svg",
  "CD": "packages/country_picker_bkb/lib/assets/svg/cd.svg",
  "CF": "packages/country_picker_bkb/lib/assets/svg/cf.svg",
  "CG": "packages/country_picker_bkb/lib/assets/svg/cg.svg",
  "CH": "packages/country_picker_bkb/lib/assets/svg/ch.svg",
  "CI": "packages/country_picker_bkb/lib/assets/svg/ci.svg",
  "CK": "packages/country_picker_bkb/lib/assets/svg/ck.svg",
  "CL": "packages/country_picker_bkb/lib/assets/svg/cl.svg",
  "CM": "packages/country_picker_bkb/lib/assets/svg/cm.svg",
  "CN": "packages/country_picker_bkb/lib/assets/svg/cn.svg",
  "CO": "packages/country_picker_bkb/lib/assets/svg/co.svg",
  "CR": "packages/country_picker_bkb/lib/assets/svg/cr.svg",
  "CU": "packages/country_picker_bkb/lib/assets/svg/cu.svg",
  "CV": "packages/country_picker_bkb/lib/assets/svg/cv.svg",
  "CW": "packages/country_picker_bkb/lib/assets/svg/cw.svg",
  "CX": "packages/country_picker_bkb/lib/assets/svg/cx.svg",
  "CY": "packages/country_picker_bkb/lib/assets/svg/cy.svg",
  "CZ": "packages/country_picker_bkb/lib/assets/svg/cz.svg",
  "DE": "packages/country_picker_bkb/lib/assets/svg/de.svg",
  "DJ": "packages/country_picker_bkb/lib/assets/svg/dj.svg",
  "DK": "packages/country_picker_bkb/lib/assets/svg/dk.svg",
  "DM": "packages/country_picker_bkb/lib/assets/svg/dm.svg",
  "DO": "packages/country_picker_bkb/lib/assets/svg/do.svg",
  "DZ": "packages/country_picker_bkb/lib/assets/svg/do.svg",
  "EC": "packages/country_picker_bkb/lib/assets/svg/ec.svg",
  "EE": "packages/country_picker_bkb/lib/assets/svg/ee.svg",
  "EG": "packages/country_picker_bkb/lib/assets/svg/eg.svg",
  "EH": "packages/country_picker_bkb/lib/assets/svg/eh.svg",
  "ENG": "packages/country_picker_bkb/lib/assets/svg/eng.svg",
  "ER": "packages/country_picker_bkb/lib/assets/svg/er.svg",
  "ES": "packages/country_picker_bkb/lib/assets/svg/es.svg",
  "ET": "packages/country_picker_bkb/lib/assets/svg/et.svg",
  "EU": "packages/country_picker_bkb/lib/assets/svg/eu.svg",
  "FI": "packages/country_picker_bkb/lib/assets/svg/fi.svg",
  "FJ": "packages/country_picker_bkb/lib/assets/svg/fj.svg",
  "FK": "packages/country_picker_bkb/lib/assets/svg/fk.svg",
  "FM": "packages/country_picker_bkb/lib/assets/svg/fm.svg",
  "FO": "packages/country_picker_bkb/lib/assets/svg/fo.svg",
  "FR": "packages/country_picker_bkb/lib/assets/svg/fr.svg",
  "GA": "packages/country_picker_bkb/lib/assets/svg/ga.svg",
  "GB": "packages/country_picker_bkb/lib/assets/svg/gb.svg",
  "GD": "packages/country_picker_bkb/lib/assets/svg/gd.svg",
  "GE": "packages/country_picker_bkb/lib/assets/svg/ge.svg",
  "GF": "packages/country_picker_bkb/lib/assets/svg/gf.svg",
  "GG": "packages/country_picker_bkb/lib/assets/svg/gg.svg",
  "GH": "packages/country_picker_bkb/lib/assets/svg/gh.svg",
  "GI": "packages/country_picker_bkb/lib/assets/svg/gi.svg",
  "GL": "packages/country_picker_bkb/lib/assets/svg/gl.svg",
  "GM": "packages/country_picker_bkb/lib/assets/svg/gm.svg",
  "GN": "packages/country_picker_bkb/lib/assets/svg/gn.svg",
  "GP": "packages/country_picker_bkb/lib/assets/svg/gp.svg",
  "GQ": "packages/country_picker_bkb/lib/assets/svg/gq.svg",
  "GR": "packages/country_picker_bkb/lib/assets/svg/gr.svg",
  "GS": "packages/country_picker_bkb/lib/assets/svg/gs.svg",
  "GT": "packages/country_picker_bkb/lib/assets/svg/gt.svg",
  "GU": "packages/country_picker_bkb/lib/assets/svg/gu.svg",
  "GW": "packages/country_picker_bkb/lib/assets/svg/gw.svg",
  "GY": "packages/country_picker_bkb/lib/assets/svg/gy.svg",
  "HK": "packages/country_picker_bkb/lib/assets/svg/hk.svg",
  "HM": "packages/country_picker_bkb/lib/assets/svg/hm.svg",
  "HN": "packages/country_picker_bkb/lib/assets/svg/hn.svg",
  "HR": "packages/country_picker_bkb/lib/assets/svg/hr.svg",
  "HT": "packages/country_picker_bkb/lib/assets/svg/ht.svg",
  "HU": "packages/country_picker_bkb/lib/assets/svg/hu.svg",
  "ID": "packages/country_picker_bkb/lib/assets/svg/id.svg",
  "IE": "packages/country_picker_bkb/lib/assets/svg/ie.svg",
  "IL": "packages/country_picker_bkb/lib/assets/svg/il.svg",
  "IM": "packages/country_picker_bkb/lib/assets/svg/im.svg",
  "IN": "packages/country_picker_bkb/lib/assets/svg/in.svg",
  "IO": "packages/country_picker_bkb/lib/assets/svg/io.svg",
  "IQ": "packages/country_picker_bkb/lib/assets/svg/iq.svg",
  "IR": "packages/country_picker_bkb/lib/assets/svg/ir.svg",
  "IS": "packages/country_picker_bkb/lib/assets/svg/is.svg",
  "IT": "packages/country_picker_bkb/lib/assets/svg/it.svg",
  "JE": "packages/country_picker_bkb/lib/assets/svg/je.svg",
  "JM": "packages/country_picker_bkb/lib/assets/svg/jm.svg",
  "JO": "packages/country_picker_bkb/lib/assets/svg/jo.svg",
  "JP": "packages/country_picker_bkb/lib/assets/svg/jp.svg",
  "KE": "packages/country_picker_bkb/lib/assets/svg/ke.svg",
  "KG": "packages/country_picker_bkb/lib/assets/svg/kg.svg",
  "KH": "packages/country_picker_bkb/lib/assets/svg/kh.svg",
  "KI": "packages/country_picker_bkb/lib/assets/svg/ki.svg",
  "KM": "packages/country_picker_bkb/lib/assets/svg/km.svg",
  "KN": "packages/country_picker_bkb/lib/assets/svg/kn.svg",
  "KP": "packages/country_picker_bkb/lib/assets/svg/kp.svg",
  "KR": "packages/country_picker_bkb/lib/assets/svg/kr.svg",
  "KW": "packages/country_picker_bkb/lib/assets/svg/kw.svg",
  "KY": "packages/country_picker_bkb/lib/assets/svg/ky.svg",
  "KZ": "packages/country_picker_bkb/lib/assets/svg/kz.svg",
  "LA": "packages/country_picker_bkb/lib/assets/svg/la.svg",
  "LB": "packages/country_picker_bkb/lib/assets/svg/lb.svg",
  "LC": "packages/country_picker_bkb/lib/assets/svg/lc.svg",
  "LI": "packages/country_picker_bkb/lib/assets/svg/li.svg",
  "LK": "packages/country_picker_bkb/lib/assets/svg/lk.svg",
  "LR": "packages/country_picker_bkb/lib/assets/svg/lr.svg",
  "LS": "packages/country_picker_bkb/lib/assets/svg/ls.svg",
  "LT": "packages/country_picker_bkb/lib/assets/svg/lt.svg",
  "LU": "packages/country_picker_bkb/lib/assets/svg/lu.svg",
  "LV": "packages/country_picker_bkb/lib/assets/svg/lv.svg",
  "LY": "packages/country_picker_bkb/lib/assets/svg/ly.svg",
  "MA": "packages/country_picker_bkb/lib/assets/svg/ma.svg",
  "MC": "packages/country_picker_bkb/lib/assets/svg/mc.svg",
  "MD": "packages/country_picker_bkb/lib/assets/svg/md.svg",
  "ME": "packages/country_picker_bkb/lib/assets/svg/me.svg",
  "MF": "packages/country_picker_bkb/lib/assets/svg/mf.svg",
  "MG": "packages/country_picker_bkb/lib/assets/svg/mg.svg",
  "MH": "packages/country_picker_bkb/lib/assets/svg/mh.svg",
  "MK": "packages/country_picker_bkb/lib/assets/svg/mk.svg",
  "ML": "packages/country_picker_bkb/lib/assets/svg/ml.svg",
  "MM": "packages/country_picker_bkb/lib/assets/svg/mm.svg",
  "MN": "packages/country_picker_bkb/lib/assets/svg/mn.svg",
  "MO": "packages/country_picker_bkb/lib/assets/svg/mo.svg",
  "MP": "packages/country_picker_bkb/lib/assets/svg/mp.svg",
  "MQ": "packages/country_picker_bkb/lib/assets/svg/mq.svg",
  "MR": "packages/country_picker_bkb/lib/assets/svg/mr.svg",
  "MS": "packages/country_picker_bkb/lib/assets/svg/ms.svg",
  "MT": "packages/country_picker_bkb/lib/assets/svg/mt.svg",
  "MU": "packages/country_picker_bkb/lib/assets/svg/mu.svg",
  "MV": "packages/country_picker_bkb/lib/assets/svg/mv.svg",
  "MW": "packages/country_picker_bkb/lib/assets/svg/mw.svg",
  "MX": "packages/country_picker_bkb/lib/assets/svg/mx.svg",
  "MY": "packages/country_picker_bkb/lib/assets/svg/my.svg",
  "MZ": "packages/country_picker_bkb/lib/assets/svg/mz.svg",
  "NA": "packages/country_picker_bkb/lib/assets/svg/na.svg",
  "NC": "packages/country_picker_bkb/lib/assets/svg/nc.svg",
  "NE": "packages/country_picker_bkb/lib/assets/svg/ne.svg",
  "NF": "packages/country_picker_bkb/lib/assets/svg/nf.svg",
  "NG": "packages/country_picker_bkb/lib/assets/svg/ng.svg",
  "NI": "packages/country_picker_bkb/lib/assets/svg/ni.svg",
  "NIR": "packages/country_picker_bkb/lib/assets/svg/nir.svg",
  "NL": "packages/country_picker_bkb/lib/assets/svg/nl.svg",
  "NO": "packages/country_picker_bkb/lib/assets/svg/no.svg",
  "NP": "packages/country_picker_bkb/lib/assets/svg/np.svg",
  "NR": "packages/country_picker_bkb/lib/assets/svg/nr.svg",
  "NU": "packages/country_picker_bkb/lib/assets/svg/nu.svg",
  "NZ": "packages/country_picker_bkb/lib/assets/svg/nz.svg",
  "OM": "packages/country_picker_bkb/lib/assets/svg/om.svg",
  "PA": "packages/country_picker_bkb/lib/assets/svg/pa.svg",
  "PE": "packages/country_picker_bkb/lib/assets/svg/pe.svg",
  "PF": "packages/country_picker_bkb/lib/assets/svg/pf.svg",
  "PG": "packages/country_picker_bkb/lib/assets/svg/pg.svg",
  "PH": "packages/country_picker_bkb/lib/assets/svg/ph.svg",
  "PK": "packages/country_picker_bkb/lib/assets/svg/pk.svg",
  "PL": "packages/country_picker_bkb/lib/assets/svg/pl.svg",
  "PM": "packages/country_picker_bkb/lib/assets/svg/pm.svg",
  "PN": "packages/country_picker_bkb/lib/assets/svg/pn.svg",
  "PR": "packages/country_picker_bkb/lib/assets/svg/pr.svg",
  "PS": "packages/country_picker_bkb/lib/assets/svg/ps.svg",
  "PT": "packages/country_picker_bkb/lib/assets/svg/pt.svg",
  "PW": "packages/country_picker_bkb/lib/assets/svg/pw.svg",
  "PY": "packages/country_picker_bkb/lib/assets/svg/py.svg",
  "QA": "packages/country_picker_bkb/lib/assets/svg/qa.svg",
  "RE": "packages/country_picker_bkb/lib/assets/svg/re.svg",
  "RO": "packages/country_picker_bkb/lib/assets/svg/ro.svg",
  "RS": "packages/country_picker_bkb/lib/assets/svg/rs.svg",
  "RU": "packages/country_picker_bkb/lib/assets/svg/ru.svg",
  "RW": "packages/country_picker_bkb/lib/assets/svg/rw.svg",
  "SA": "packages/country_picker_bkb/lib/assets/svg/sa.svg",
  "SB": "packages/country_picker_bkb/lib/assets/svg/sb.svg",
  "SC": "packages/country_picker_bkb/lib/assets/svg/sc.svg",
  "SCT": "packages/country_picker_bkb/lib/assets/svg/sct.svg",
  "SD": "packages/country_picker_bkb/lib/assets/svg/sd.svg",
  "SE": "packages/country_picker_bkb/lib/assets/svg/se.svg",
  "SG": "packages/country_picker_bkb/lib/assets/svg/sg.svg",
  "SH": "packages/country_picker_bkb/lib/assets/svg/sh.svg",
  "SI": "packages/country_picker_bkb/lib/assets/svg/si.svg",
  "SJ": "packages/country_picker_bkb/lib/assets/svg/sj.svg",
  "SK": "packages/country_picker_bkb/lib/assets/svg/sk.svg",
  "SL": "packages/country_picker_bkb/lib/assets/svg/sl.svg",
  "SM": "packages/country_picker_bkb/lib/assets/svg/sm.svg",
  "SN": "packages/country_picker_bkb/lib/assets/svg/sn.svg",
  "SO": "packages/country_picker_bkb/lib/assets/svg/so.svg",
  "SR": "packages/country_picker_bkb/lib/assets/svg/sr.svg",
  "SS": "packages/country_picker_bkb/lib/assets/svg/ss.svg",
  "ST": "packages/country_picker_bkb/lib/assets/svg/st.svg",
  "SV": "packages/country_picker_bkb/lib/assets/svg/sv.svg",
  "SX": "packages/country_picker_bkb/lib/assets/svg/sx.svg",
  "SY": "packages/country_picker_bkb/lib/assets/svg/sy.svg",
  "SZ": "packages/country_picker_bkb/lib/assets/svg/sz.svg",
  "TC": "packages/country_picker_bkb/lib/assets/svg/tc.svg",
  "TD": "packages/country_picker_bkb/lib/assets/svg/td.svg",
  "TF": "packages/country_picker_bkb/lib/assets/svg/tf.svg",
  "TG": "packages/country_picker_bkb/lib/assets/svg/tg.svg",
  "TH": "packages/country_picker_bkb/lib/assets/svg/th.svg",
  "TJ": "packages/country_picker_bkb/lib/assets/svg/tj.svg",
  "TK": "packages/country_picker_bkb/lib/assets/svg/tk.svg",
  "TL": "packages/country_picker_bkb/lib/assets/svg/tl.svg",
  "TM": "packages/country_picker_bkb/lib/assets/svg/tm.svg",
  "TN": "packages/country_picker_bkb/lib/assets/svg/tn.svg",
  "TO": "packages/country_picker_bkb/lib/assets/svg/to.svg",
  "TR": "packages/country_picker_bkb/lib/assets/svg/tr.svg",
  "TT": "packages/country_picker_bkb/lib/assets/svg/tt.svg",
  "TV": "packages/country_picker_bkb/lib/assets/svg/tv.svg",
  "TW": "packages/country_picker_bkb/lib/assets/svg/tw.svg",
  "TZ": "packages/country_picker_bkb/lib/assets/svg/tz.svg",
  "UA": "packages/country_picker_bkb/lib/assets/svg/ua.svg",
  "UG": "packages/country_picker_bkb/lib/assets/svg/ug.svg",
  "UM": "packages/country_picker_bkb/lib/assets/svg/um.svg",
  "US": "packages/country_picker_bkb/lib/assets/svg/us.svg",
  "UY": "packages/country_picker_bkb/lib/assets/svg/uy.svg",
  "UZ": "packages/country_picker_bkb/lib/assets/svg/uz.svg",
  "VA": "packages/country_picker_bkb/lib/assets/svg/va.svg",
  "VC": "packages/country_picker_bkb/lib/assets/svg/vc.svg",
  "VE": "packages/country_picker_bkb/lib/assets/svg/ve.svg",
  "VG": "packages/country_picker_bkb/lib/assets/svg/vg.svg",
  "VI": "packages/country_picker_bkb/lib/assets/svg/vi.svg",
  "VN": "packages/country_picker_bkb/lib/assets/svg/vn.svg",
  "VU": "packages/country_picker_bkb/lib/assets/svg/vu.svg",
  "WF": "packages/country_picker_bkb/lib/assets/svg/wf.svg",
  "WLS": "packages/country_picker_bkb/lib/assets/svg/wls.svg",
  "WS": "packages/country_picker_bkb/lib/assets/svg/ws.svg",
  "XK": "packages/country_picker_bkb/lib/assets/svg/xk.svg",
  "YE": "packages/country_picker_bkb/lib/assets/svg/ye.svg",
  "YT": "packages/country_picker_bkb/lib/assets/svg/yt.svg",
  "ZA": "packages/country_picker_bkb/lib/assets/svg/za.svg",
  "ZM": "packages/country_picker_bkb/lib/assets/svg/zm.svg",
  "ZW": "packages/country_picker_bkb/lib/assets/svg/zw.svg",
};

ValueNotifier<CountryModel> selectedCountryDetailsForPhoneCode=ValueNotifier(CountryModel());

ValueNotifier<CountryModel> selectedDetailsForCountry = ValueNotifier(CountryModel());

ValueNotifier<StateModel> selectedDetailsForState=ValueNotifier(StateModel());

ValueNotifier<CityModel> selectedDetailsForCity=ValueNotifier(CityModel());

List<CountryModel> totalCounties = [];

List<StateModel> totalStates= [];

List<CityModel> totalCities= [];

List<CountryModel> filteredCountriesForCode=[];

List<CountryModel> filteredCountries=[];

List<StateModel> filteredState=[];

List<CityModel> filteredCity=[];

TextEditingController phoneCodeFilter = TextEditingController();
TextEditingController countryFilter=TextEditingController();
TextEditingController stateFilter=TextEditingController();
TextEditingController cityFilter=TextEditingController();