DESTDIR = /tmp/rf-dyn-ip-$(USER)

all:

install-client:
	@for i in /etc /usr/bin /usr/lib/systemd/system ; \
	do \
		mkdir -p $(DESTDIR)/$$i ; \
	done
	install -m 555 client/rf-dyn-ipip         $(DESTDIR)/usr/bin/
	install -m 644 client/rf-dyn-ipip.conf    $(DESTDIR)/etc/
	install -m 644 client/rf-dyn-ipip.service $(DESTDIR)/usr/lib/systemd/system/

install-server:
	@for i in /etc/httpd/conf.d /var/www/cgi-bin/ /etc/sudoers.d \
	          /usr/share/rf-dyn-ipip /var/lib/rf-dyn-ipip/clients.d \
	          /etc/sysctl.d /usr/lib/systemd/system/ ; \
	do \
		mkdir -p $(DESTDIR)/$$i ; \
	done
	install -m 444 server/httpd.conf          $(DESTDIR)/etc/httpd/conf.d/rf-dyn-ipip.conf
	install -m 555 server/rf-dyn-ipip.cgi     $(DESTDIR)/var/www/cgi-bin/
	install -m 500 server/set-remote          $(DESTDIR)/usr/share/rf-dyn-ipip/
	install -m 500 server/start-all           $(DESTDIR)/usr/share/rf-dyn-ipip/
	install -m 400 server/sudo.conf           $(DESTDIR)/etc/sudoers.d/rf-dyn-ipip
	install -m 444 server/sysctl.conf         $(DESTDIR)/etc/sysctl.d/rf-dyn-ipip.conf
	install -m 644 rf-dyn-ipip-server.service $(DESTDIR)/usr/lib/systemd/system/rf-dyn-ipip-server.service
