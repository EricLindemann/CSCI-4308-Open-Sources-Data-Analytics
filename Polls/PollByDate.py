from pollster import Pollster
from datetime import date
import sys

pollster = Pollster()

def presPollsByDate(start, end):
	try:
		start = start.split('-', 2)
		start = date(int(start[0]), int(start[1]), int(start[2]))
		end = end.split('-', 2)
		end = date(int(end[0]), int(end[1]), int(end[2]))
	except:
		print 'Date could not be parsed correctly'
		print 'Make sure it is in the format YYYY-MM-DD'
		return
	pollCat = pollster.charts()[0].estimates_by_date()
	for x in range(1, len(pollCat)):
		poll = pollCat[x]
		pollDate = poll['date'].split('-', 2)
		pollDate = date(int(pollDate[0]), int(pollDate[1]), int(pollDate[2]))
		if(pollDate > start and pollDate < end):
			#print '\nPoll:\n' + str(poll) + '\n'
			#figure out who the winner was
			highestVal = 0
			winner = ''
			print 'Poll Values:'
			for y in poll['estimates']:
				print y
				if(y['value'] > highestVal):
					highestVal = y['value']
					winner = y['choice']
			print('Winner: ' + winner)



if(len(sys.argv) != 3):
	print 'Usage: python PollByDate.py <start_date> <end_date>'
	print 'Date format: YYYY-MM-DD'
else:
	presPollsByDate(sys.argv[1], sys.argv[2])