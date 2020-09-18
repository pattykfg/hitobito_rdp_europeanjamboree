# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.

module RdpEuropeanjamboree
    module Export::Pdf::Registration
        class Payment < Section
    
            def render
                pdf.y = bounds.height - 60
                bounding_box([0, 230.mm], width: bounds.width, height: bounds.height - 200) do
                    font_size(10) do
                        text list, style: :italic, width: bounds.width
                    end
                end
            end

            def list
                pdf.start_new_page
                text "SEPA Lastschriftverfahren", :size => 14
                if @person.payment_recieved
                    pdf.move_down 4.mm
                    text "Die Raten zur Teilnahme am Jamboree sind vollständig beglichen."
                else 
                    pdf.move_down 4.mm
                        text "Die Raten zur Teilnahme am Jamboree werden mittels SEPA-Basislastschrift eingezogen:"
                    pdf.move_down 2.mm
                    text "Ich ermächtige den Ring deutscher Pfadfinder*innenverbände e.V., die Zahlungen gemäß Zahlungsplan von meinem Konto mittels Lastschrift einzuziehen. Zugleich weise ich mein Kreditinstitut an, die vom Ring deutscher Pfadfinder*innenverbände e.V. auf mein Konto gezogenen Lastschriften einzulösen."
                        pdf.move_down 2.mm
                        text "Hinweis: Ich kann innerhalb von acht Wochen, beginnend mit dem Belastungsdatum, die Erstattung des belasteten Betrages verlangen. Es gelten dabei die mit meinem Kreditinstitut vereinbarten Bedingungen."
                        pdf.move_down 2.mm
                        attendee_data = pdf.make_table([
                        [{:content => "IBAN:", :width => 150}, @person.sepa_iban],
                        ["Mandatsreferenz:", "ejrdp" + @person.id.to_s],
                        ["Gläubiger*innen-Identifikationsnummer:", "DE81 WSJ 0000 2017 275"],
                        ["Kontoinhaber*in:", @person.sepa_name]],
                        :cell_style => {:padding => 1, :border_width => 0, :inline_format => true})
                        attendee_data.draw
                        text "" #gets rid of strange text in last line
                        pdf.move_down 5.mm

                    pdf.make_table([
                        [{:content => @person.town + " den " + Date.today.strftime("%d.%m.%Y"), :height => 30}],
                                ["______________________________", ""],
                            [{:content => @person.sepa_name, :height => 30}, ""]],
                            :cell_style => {:width => 240, :padding => 1,  :border_width => 0, :inline_format => true}).draw
                    text ""
                end
            end 
        end
    end
end  