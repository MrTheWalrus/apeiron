# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Note: Seed file should ideally be idempotent.

def update_by_attribute(klass, attribute, data)
  data.each do |record_attrs|
    item = klass.send("find_or_create_by_#{attribute}", record_attrs[attribute])
    item.update(record_attrs)
  end
end

update_by_attribute(Resource, :name, [
  {name: 'N2', description: "Manufacturing-grade (metallic) Naquadah. Key element in Goa'uld technology from hand devices to ship hulls. This lot was reforged from salvaged armor plates from the <i>Dread Crocodile</i>.", quantity: 2140, unit: 'kg'},
  {name: 'N3', description: "Enriched and refined 'weapons-grade' Naquadah. Extremely high energy density, used to power nearly all Goa'uld technology, and as fuel in the Mk1 Naquadah Generator. As the enrichment process not yet well understood, the SGC stockpile of N3 is exclusively the product of raids on Goa'uld worlds, though the ARES mining operation is expected to being producing more within 6-8 weeks. Each generator consumes up to ~100g per week, depending on load and configuration.", quantity: 19.4, unit: 'kg'},
  {name: 'Trinium', description: 'Superlatively strong and lightweight metal. Essential component in Tollan phase-shifting technology. A considerable quantity is in storage at the SGC, a gift from the Omeyocan following the Battle of Haquvits Temple.', quantity: 200, unit: 'kg'},
  {name: 'Naquadah Generators', description: "The Naquadah Generator was developed by Maj. Carter's team at the SGC, based on an example unit provided by the Orbanians. It consumes small quantities of enriched naquadah (N3) to produce comparatively vast quanities of clean, safe electrical power. This, combined with its portable design and ease of operation, makes it ideal for off-world missions. These units are part of the Mk1 production run, manufactured by a joint US-Russian effort headed by Dr. Rodney McKay. <span class='good'>3</span> are currently active in Omega Base.", quantity: 2, unit: ''},
])



update_by_attribute(Faction, :name, [
  {name: "Anubis & Underlings", fleet: '900', territory: '35*',
    notes: "The largest single force of of Anubis forces is commanded by his lieutenant, Zipacna. OSI notes high uncertainty in these estimates due to the difficulty of maintaining agents among the forces of Anubis."},
  {name: "Yu and Allies", fleet: '725', territory: '63',
    notes: "Includes the forces of Yu, Amaterasu, and Bastet. It is believed that the primary strategic commander is Yu's First Prime, Oshu. High confidence in territorial claims due to ongoing diplomatic relations."},
  {name: "Ba'al", fleet: '470', territory: '28',
    notes: "Ba'al commands the largest force not currently committed to the ongoing conflict. So far, Ba'al appears to be hanging back and avoiding conflict. His motives, as always, are unclear."},
  {name: "Kali", fleet: '85', territory: '3',
    notes: "OSI predicts that Kali will shortly follow the example of Bastet and ally with Lord Yu."},
  {name: "Olokun/Svarog", fleet: '0', territory: '0*',
    notes: "Both of the Goa'uld have been effectively wiped out by Anubis. They are personally unaccounted for, and may be dead or in the service of Anubis. In any case, neither retains any significant military strength or territory."},
  {name: "Morrigan", fleet: '65', territory: '4',
    notes: ""},
  {name: "'Free' Jaffa", fleet: '3', territory: '1*',
    notes: "The Jaffa rebellion is small and has limited organization. They do, however, have a handful of captured death gliders and single partially-demilitarized <i>Al'kesh</i>. They currently share space at the SGC Alpha Site."},
  {name: "Earth/SGC", fleet: '2', territory: '3*',
    notes: "Salvaged gliders from various sources, including the <i>Dread Crocodile</i>. Includes the first squad of <i>Project Antaeus</i> prototypes, projected to be in service in ~6 weeks. <i>Project Prometheus</i> (being on indefinite hold), and Omega Base resources (inoperative and inestimable) are not included. System count excludes bases not reported to Yu’s Alliance."},
])

update_by_attribute(Mission, :number, [
  {number: '301', name: "Spectres",
    brief: "Settling in at Omega Base.",
    status: 'active'
  },
  {number: '302', name: "Outgrowth",
    status: 'hidden'
  },
  {number: '303', name: "Blade That Was Broken",
    status: 'hidden'
  },
  {number: '304', name: "Time of Need",
    status: 'hidden'
  },
  {number: '305', name: "Muddy Waters",
    status: 'hidden'
  },
  {number: '306', name: "Politics",
    status: 'hidden'
  },
  {number: '307-1', name: "Belly of the Beast",
    status: 'hidden'
  },
  {number: '307-2', name: "A Fire Shall Be Woken",
    status: 'hidden'
  },
])


# name: text, proposer: text, description: text, resources: text, status: string 
update_by_attribute(Project, :name, [
  {name: "Establish base camp", 
    proposer: "Lt. Col. S. Carlsson", 
    description: "We put a generator in the tree room and piled up supplies. It’s fine. I don’t understand why I have to enter this into some system. It’s already done.", 
    resources: '1 Naquadah Generator', 
    status: 'complete', 
    approved_at: 4.weeks.ago},
  {name: "Power up the bridge", 
    proposer: "MSgt. D. Maguire", 
    description: "Fun fact: This field has a minimum length of 50...", 
    resources: '1 Naquadah Generator', 
    status: 'complete', 
    approved_at: 4.weeks.ago},
  {name: "Manufacturing Workshop", 
    proposer: "SSgt. D. Strider", 
    description: "Airman Tre’bek’s recon parties have located what we think was a primary engineering facility in the stern sector. This facility could be set it up as a base of operations for the repair teams. While studies of the existing machinery in this area are incomplete, the space itself is suitable for setting up our own gear: milling machines, forges, smelters, presses, etc. This project would require a generator to run the machines.",
    resources: "1 Naquadah Generator", 
    status: 'complete', 
    approved_at: 2.weeks.ago},
  {name: "Intraship Tram - Main Line Activation", 
    proposer: "Dr. F. Michaels", 
    description: "<i>Apeiron</i> is immense - imagine a skyscraper that covers six hundred city blocks. Keeping our teams supplied is starting to strain on our logistical abilities. It looks like the Ancients used a network of super-fast ‘train cars’ (for lack of a better term), to move quickly between different areas of the ship. I’m not sure why - they certainly had the technology to teleport via transport rings. Anyway, given the number of personnel we’re bringing it, I recommend we attempt to bring at least the central pathway of this network back online. We can use the generator already installed in the Arboretum for power, but there are a some cracks in the rails that should be repaired. They appear to be constructed of a naquadah-iron-titanium alloy that Sgt. Strider assures me we can replicate without difficulty.", 
    resources: '~160kg of N2', 
    status: 'complete', 
    approved_at: 1.week.ago },
  {name: "Deep Memory Sampling", proposer: 'Lt. G. Satterfield', 
    description: "<i>Apeiron</i> is as much an archive as a ship - every bulkhead and deck plate contains a crystal lattice capable of storing vast amounts of information. This ‘Deep Memory’ storage could contain incredibly valuable information from the Ancients. I’ve developed a portable device that should allow our researchers to temporarily power up a local section of Deep Memory and, hopefully, extract some of that information. The device is powered by a liquid Naquadah fuel cell, similar to that used in the Ma’tok staff weapon. Without the primary AI available, we have no way of knowing what’s stored where, but any information stored by the Ancients must be worth having.", 
    resources: '250g N3. Timeframe: 1 week for initial tests.', 
    status: 'approved', 
    approved_at: DateTime.now},
  {name: "Power Core Chamber Repair", proposer: 'SSgt. D. Strider', 
    description: 'Per MSgt. Maguire’s instruction, we have completed a preliminary analysis of the <i>Apeiron</i> power core (the hologram calls it a <i>potentia nexus</i>). Full report is on file. There’s nothing to be done about the crystals themselves, but we can begin repairs on the chamber containing them - replacing the ‘stalks’ that would hold the four missing crystals, and repairing the heavy armor of the chamber itself. This should result in a marginal increase in power generated by the core. These repairs will also prevent us all from dying of exposure to exotic particle radiation and/or superhot plasma, if and when the core is restored to full power.', 
    resources: '500-600kg of N2, ~100kg of Trinium. Timeframe: 3-4 weeks', 
    status: 'approved', approved_at: DateTime.now},
  {name: "Repurpose Sentinels for Repair Work",
    proposer: "Dr. F. Michaels",
    description: "With <i>Soror Secunda</i> on our side and reconnected with <i>Nove Thule</i> Shipyard, we've gained control of the Sentinels - the robotic guardians encountered during our initial exploration. They are autonomous, internally-powered, and highly resistent to hostile environments, making them ideal for a several possible tasks. There are a limited number of viable Sentinels, so I recommend we select only one role for them. This proposed reconfiguration would equip the Sentinels with nanofabricators, hyperadhesives and welding tools, and assign them the task of damage control.",
    resources: 'None. Timeframe: 1 week.',
    status: 'pending',
    mission: Mission.find_by_name('Spectres')
  },
  {name: "Repurpose Sentinels for Point Defense",
    proposer: "Dr. F. Michaels",
    description: "With <i>Soror Secunda</i> on our side and reconnected with <i>Nove Thule</i> Shipyard, we've gained control of the Sentinels - the robotic guardians encountered during our initial exploration. They are autonomous, internally-powered, and highly resistent to hostile environments, making them ideal for a several possible tasks. There are a limited number of viable Sentinels, so I recommend we select only one role for them. This proposed reconfiguration would enable the Sentinels to be launched from <i>Apeiron's</i> hanger. Their existing stasis generators would allow them to intercept enemy projectiles and fighter craft.",
    resources: '50kg of N2, Temporary deployment of naquadah generator for testing. Timeframe: 1 week.',
    status: 'pending',
    mission: Mission.find_by_name('Spectres')
  },
  {name: "Refinish Hull",
    proposer: "Cpl. A. Lopez",
    description: "So, I was thinking, this ship is pretty banged up from icicles and stuff. My uncle worked in an autobody shop, and he'd be pissed at us for leaving all these dents and dings and stuff in the hull plates. I talked to a couple of the engineers, and they say all it would take to get it sorted out is time and a little bit of trinium.",
    resources: "5kg of Trinium. Timeframe: 5-8 weeks",
    status: 'pending',
    mission: Mission.find_by_name('Spectres')
  },
  {name: "Replace Lateral <i>Apis</i> Launcher",
    proposer: "SSgt. D. Strider",
    description: "Our survey teams have confirmed it - the lateral launcher was right in the blast when the core blew. It just plain isn't there any more. However, the launchers are actually pretty simple machines, and most of the control linkages are still in place. We could manufacture a replacement launcher and tie it into the system without too much trouble. It'd mean a 25% increase in salvo strength. Also in ammo consumption, but them's the breaks, eh?",
    resources: '1000kg of N2',
    status: 'pending',
    mission: Mission.find_by_name('Outgrowth')
  },
  {name: "Repair Port Superstructure",
    proposer: "SSgt. D. Strider",
    description: "With the new materials coming in, we can finally get to work rebuilding the bulkheads, deckplates and exterior armor in Sector 4. I don't know if it's ever going to be as good as new, but it'll be spaceworthy and plenty tough.",
    resources: "2500kg of N1 Struts, 1000kg of N1 Plates. Timeframe: 4-6 weeks.",
    status: 'pending',
    mission: Mission.find_by_name('Blade That Was Broken')
  },
  {name: "Reinforcing Struts",
    proposer: "SSgt. D. Strider",
    description: "The ship has lots of big open areas that we're not using for anything. Atriums, gymnasiums, food courts, I dunno. They're pretty, okay, but they create potential structural weak points. If there are any of the new struts left over, we could use them to reinforce those areas. Might give us a little more combat survivablity.",
    resources: "1000kg of N1 Struts",
    status: 'pending',
    mission: Mission.find_by_name('Blade That Was Broken')
  },
  {name: "Mount Railgun Turrets",
    proposer: "SSgt. D. Strider",
    description: "If we use some our N1 output for its original purpose, we could mount a ton of railguns on the ship.",
    resources: "1000kg of N1 Struts",
    status: 'pending',
    mission: Mission.find_by_name('Blade That Was Broken')
  },
  {name: "Install Salvaged Energy Turrets",
    proposer: "SSgt. D. Strider",
    description: "The <i>Dread Crocodile</i> is armed with dozens of prototype plasma cannons. According to our intel, they're the same design that Anubis recently rolled out to his entire fleet. Now, all their firmware is bricked to hell and back, but the guns themselves are mostly in working order. We could salvage the lot of them and give <i>Apeiron</i> a decent broadside",
    resources: "All the plasma cannons.",
    status: 'pending',
    mission: Mission.find_by_name('Muddy Waters')
  },
  {name: "Install Shield Regulator",
    proposer: "SSgt. D. Strider",
    description: "Now that we've recovered the shield core, we can install and configure it to act as our missing shield regulator. It's not quite the same part that was destroyed, but apparently with some reprogramming, it should be a viable substitute. We'll also need to move a few dozen shield emitters to fix the hole.",
    resources: "1 Ancient Shield Core, Timefame: 2 weeks",
    status: 'pending',
    mission: Mission.find_by_name('Time of Need')
  },
  {name: "Tune Shield Harmonics",
    proposer: "Dr. F. Michaels",
    description: "According to <i>Secunda</i>, the new shield regulator is a close but imperfect match for the one that was lost in the core overload. She says she can instruct our engineers on how to tune the existing regulators - apparently a more even power flow will make the shields more resilient.",
    resources: "Timefame: 3 weeks",
    status: 'pending',
    mission: Mission.find_by_name('Time of Need')
  },
  {name: "Install Missile Tubes",
    proposer: "Dr. Simone Gleb, DARPA",
    description: "There's a huge crate in the weekly mail deliveries from the SGC. It has a note attached: 'It was a real pleasure meeting with you and your team, Col. Carlsson. I've asked the director of DARPA to consider, purely as a hypothetical, of course, what she'd arm a space-capable battleship with. I hope you find her designs for the AIM-160-X and this crate of prototypes useful. 
      Best of luck, 
      Henry Hayes'",
    resources: "200kg of N2, 2kg of N3, 60kg of trinium, Timefame: 1 week",
    status: 'hidden',
    mission: Mission.find_by_name('Politics')
  },
])

# Events: name: text, description: text, action: text, resolution: text, status: string,
update_by_attribute(Event, :name, [
  {name: "Fire on High",
    description: "Anubis used the <i>Dread Crocodile</i> as a test-bed for upgraded Ha'tak plasma cannons. These upgrades are about to be rolled out to the entire fleet.",
    resolution: "Anubis has completed the deployment of upgraded weapons to his fleet. Lord Yu's ships will now need superior numbers to emerge victorious from a given engagement.",
    action: "No Action",
    status: 'hidden'
  },
  {name: "Sea Legs",
    description: "Jacob Carter and the Tok'ra have returned, and they have valuable intel gathered from the interrogation of Osiris.",
    status: 'hidden'
  },
  {name: "Ragnarok",
    description: "Word has come from Oshu - Anubis intended to attack the Protected world of Cimmeria as a demonstration of strength. The Asgard are too busy to enforce their treaty, and while Oshu wishes to protect his lord's honor, there they have no forces to spare to oppose this attack.",
    status: 'hidden'
  },
  {name: "Death Knell",
    description: "An emergency transmission has arrived from the Alpha Site - the base is under attack.",
    status: 'hidden'
  },
])
