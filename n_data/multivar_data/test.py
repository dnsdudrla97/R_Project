import sys
import censys.ipv4
try:
    Censys_api = censys.ipv4.CensysIPv4(api_id="API_KEY", api_secret="API_SECRET_KEY")

    # report("쿼리문", field, 버킷 수)
    report = Censys_api.report(""" "welcome to" AND tags.raw: "http" """, field="80.http.get.headers.server.raw", buckets=5)
    print (report)

    # view 메소드를 사용하면 IP 주소의 전체 JSON을 볼 수 있다.
    view = Censys_api.view('8.8.8.8')
    print (view)

    # search 메소드를 사용하여 쿼리 결과를 확인할 수 있다.
    for res in Censys_api.search("80.http.get.headers.server: Apache AND location.country: Korea", max_records=5):
        print (res)

    # 필드를 선택적으로 지정할 수 있다. (찾고자 하는 정보 위주로 필드 값 조절)
    FIELDS = ['ip',
            'updated_at',
            '80.http.get.title',
            '443.https.get.title',
            '25.smtp.starttls.tls.certificate.parsed.names',
            '25.smtp.starttls.tls.certificate.parsed.subject_dn',
            '110.pop3.starttls.tls.certificate.parsed.names',
            '110.pop3.starttls.tls.certificate.parsed.subject_dn']

    data = list(Censys_api.search("80.http.get.headers.server: Apache AND location.country: Korea", 
                                FIELDS, max_records=5))		 
    print (data)
    
# 예외 처리
except censys.base.CensysUnauthorizedException:
    sys.stderr.write('[+] Censys account details wrong. \n')
    exit(1)

except censys.base.CensysRateLimitExceededException:
    sys.stderr.write('[+] Limit exceeded.')
    exit(1)

except censys.ipv4.CensysException:
    sys.stderr.write('[+] CensysException.')
    exit(1)
    
# res, ipv4 기반의 일반 정보를 검색 -> dict 형태
def SearchPrint(query):
	max_title_len = 50
	title_head = 'Title: '
	cut = '[...]'
	http_title = query.get('80.http.get.title', 'N/A')
	as_name = query.get('autonomous_system.name', 'N/A')
	as_num = query.get('autonomous_system.asn', '')
	location = '{} / {}'.format(query.get('location.country_code',
                                   'N/A'), query.get('location.city', 'N/A'))
	os = query.get('metadata.os', 'N/A')
	tags = query.get('tags', '')
	ip = query.get('ip', 'N/A')

	# 문자열 변경 '\n' -> '\\n'
	http_title = http_title.replace('\n', '\\n')
	http_title = http_title.replace('\r', '\\r')

    # 타이틀이 길 경우 길이 제한
	if len(http_title) > (max_title_len-len(title_head)-1):
		http_title = str(http_title[:max_title_len-len(title_head)-len(cut)-1]) + cut

	print(ip.ljust(16) +
			((title_head + '%s') % http_title).ljust(max_title_len) +
			('AS: %s (%s)' % (as_name, as_num)).ljust(40) +
			('Loc: %s' % location).ljust(30) +
			('OS: %s' % os).ljust(15) +
			('Tags: %s' % tags))